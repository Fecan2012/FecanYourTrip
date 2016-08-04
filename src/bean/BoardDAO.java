package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

public class BoardDAO {

	private DBConnectionMgr pool = null;

	public BoardDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error:Connection Fail!");
		}
	}

	public int getArticleCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;

		try {
			con = pool.getConnection();
			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}

	public Hashtable pageList(String pageNum, int count) {
		Hashtable<String, Integer> pgList = new Hashtable<String, Integer>();

		int pageSize = 10;
		int blockSize = 10;
		int adj = pageSize - (count % pageSize);

		if (pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (((count / pageSize) - (currentPage) + 1) * pageSize + 1) - adj;
		int endRow = (((count / pageSize) - (currentPage - 1) + 1) * pageSize) - adj;
		if (count % pageSize == 0) {
			startRow = ((count / pageSize) - (currentPage)) * pageSize + 1;
			endRow = ((count / pageSize) - (currentPage - 1)) * pageSize;
		}

		System.out.println("endRow:" + currentPage + "*" + pageSize);

		int number = 0;
		number = count - (currentPage - 1) * pageSize;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1;

		if (currentPage % blockSize != 0) {
			startPage = currentPage / blockSize * blockSize + 1;
		} else {
			startPage = ((currentPage / blockSize) - 1) * blockSize + 1;
		}

		int endPage = startPage + blockSize - 1;// 1+3-1=3;

		if (endPage > pageCount) {
			endPage = pageCount;
		}

		pgList.put("pageSize", pageSize);
		pgList.put("blockSize", blockSize);
		pgList.put("currentPage", currentPage);
		pgList.put("startRow", startRow);
		pgList.put("endRow", endRow);
		pgList.put("count", count);
		pgList.put("number", number);
		pgList.put("startPage", startPage);
		pgList.put("endPage", endPage);
		pgList.put("pageCount", pageCount);

		return pgList;
	}

	public List getArticles(int start, int end, int pagesize) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;

		try {
			con = pool.getConnection();
			/*
			 * MySQL String sql="select * from board order by ref desc, "+
			 * "re_step asc limit ?,?";
			 */

			/* Oracle */

			String sql = "select * from (select num,userid," + "subject,regdate,"
					+ "content,readcount,ordernum from (select * from board order by ordernum desc"
					+ ")) where ordernum>=? and ordernum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				articleList = new ArrayList(pagesize);
				do {
					BoardDTO article = new BoardDTO();
					RepleDAO repledao = new RepleDAO();
					article.setNum(rs.getInt("num"));
					article.setUserid(rs.getString("userid"));
					article.setSubject(rs.getString("subject"));
					article.setRegdate(rs.getTimestamp("regdate"));
					article.setContent(rs.getString("content"));
					article.setReadcount(rs.getInt("readcount"));
					article.setReplecount(repledao.getRepleCount(rs.getInt("num")));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return articleList;
	}

	public int insertArticle(BoardDTO article, int grant) {
		System.out.println("insertArticle() Called");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		int number = 0;
		int orderNum = 0;
		String sql = "";

		try {
			con = pool.getConnection();
			con.setAutoCommit(true);
			pstmt = con.prepareStatement("select max(num), max(ordernum) from board");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt("max(num)") + 1;
				orderNum = rs.getInt("max(ordernum)") + 1;
			} else {
				number = 1;
			}
			sql = "insert into board(num,userid,subject," + " regdate, content,readcount,ordernum)values"
					+ "(?,?,?,?,?,?,?)";

			if (grant == 2) {
				int readcount = 0;
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, number);
				pstmt.setString(2, article.getUserid());
				pstmt.setString(3, article.getSubject());
				pstmt.setTimestamp(4, article.getRegdate());
				pstmt.setString(5, article.getContent());
				pstmt.setInt(6, readcount);
				pstmt.setInt(7, orderNum);
				result = pstmt.executeUpdate();
			} else {
				result = 0;
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return result;
	}

	public BoardDTO getArticle(int num) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO article = null;

		try {
			con = pool.getConnection();
			String sql = "update board set readcount = readcount+1 " + " where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);//
			int readupdate = pstmt.executeUpdate();
			String sql2 = "select * from board where num=?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardDTO();
				article.setNum(rs.getInt("num"));
				article.setUserid(rs.getString("userid"));
				article.setSubject(rs.getString("subject"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return article;
	}

	public BoardDTO updateGetArticle(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO article = null;
		try {
			con = pool.getConnection();
			String sql2 = "select * from board where num=?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDTO();
				article.setNum(rs.getInt("num"));
				article.setUserid(rs.getString("userid"));
				article.setSubject(rs.getString("subject"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setReplecount(rs.getInt("replecount"));
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return article;
	}

	public int updateArticle(BoardDTO article) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbuserid = "";
		String sql = "";
		int x = -1;
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement("select userid from board where num=?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbuserid = rs.getString("userid");
				if (dbuserid.equals(article.getUserid())) {
					sql = "update board set userid=?,subject=?, " + "content=? where num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, article.getUserid());
					pstmt.setString(2, article.getSubject());
					pstmt.setString(3, article.getContent());
					pstmt.setInt(4, article.getNum());
					int update = pstmt.executeUpdate();
					x = 1;
				} else {
					x = 0;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}

	public int deleteArticle(int num, int grant) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int x = -1;

		try {
			con = pool.getConnection();
			if (grant == 2) {
				sql = "delete from reple where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				int repledelete = pstmt.executeUpdate();
				sql = "delete from board where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				int delete = pstmt.executeUpdate();
				x = 1;
			} else {
				x = 0;
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}

	public void refresh() {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement("update board b set ordernum = (select ordernum from (select num, "
					+ "row_number() over(order by num) ordernum from board)" + " sub where b.num = sub.num)");
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	public int getGrant(String userid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int grant = 0;
		String sql = "";
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement("select authority from users where userid=?");
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				grant = rs.getInt("authority");
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return grant;
	}
}