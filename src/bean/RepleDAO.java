package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

public class RepleDAO {

	private DBConnectionMgr pool = null;

	public RepleDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Failed Connection!");
		}
	}

	public int getRepleCount(int pagenum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;

		try {
			con = pool.getConnection();
			String sql = "select count(*) from reple where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pagenum);
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

		int pageSize = 100;
		int blockSize = 10;

		if (pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		System.out.println("endRow:" + currentPage + "*" + pageSize);

		int number = 0;
		List articleList = null;

		number = count - (currentPage - 1) * pageSize;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1;

		if (currentPage % blockSize != 0) {
			startPage = currentPage / blockSize * blockSize + 1;
		} else {
			startPage = ((currentPage / blockSize) - 1) * blockSize + 1;
		}

		int endPage = startPage + blockSize - 1;

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

	public List getReples(int start, int end, int pagesize, int pagenum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List repleList = null;

		try {
			con = pool.getConnection();
			/*
			 * MySQL String sql="select * from board order by ref desc, "+
			 * "re_step asc limit ?,?";
			 */

			/* Oracle */
			String sql = "select * from (select rownum rnum,num,userid, "
					+ "replecontent,regdate,re_num,re_step,replenum,"
					+ " re_level from (select * from reple order by re_num asc, "
					+ "re_step asc)) where num=? and rnum>=? and rnum<=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pagenum);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				repleList = new ArrayList(pagesize);

				do {
					RepleDTO reple = new RepleDTO();
					reple.setRepleNum(rs.getInt("replenum"));
					reple.setRepleContent(rs.getString("replecontent"));
					reple.setNum(rs.getInt("num"));
					reple.setUserid(rs.getString("userid"));
					reple.setRegdate(rs.getTimestamp("regdate"));
					reple.setRe_level(rs.getInt("re_level"));
					reple.setRe_num(rs.getInt("re_num"));
					reple.setRe_step(rs.getInt("re_step"));
					repleList.add(reple);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return repleList;
	}

	public void insertReple(RepleDTO reple) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		int replenum = reple.getRepleNum();
		int re_num = reple.getRe_num();
		int re_step = reple.getRe_step();
		int re_level = reple.getRe_level();
		int number = 0;
		String sql = "";

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement("select max(re_num) from reple where num=?");
			pstmt.setInt(1, reple.getNum());
			rs = pstmt.executeQuery();

			if (rs.next())
				number = rs.getInt(1) + 1;
			else
				number = 1;

			if (replenum != 0) {
				sql = "update reple set re_step = re_step+1 " + " where re_num = ? and re_step > ? and num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, re_num);
				pstmt.setInt(2, re_step);
				pstmt.setInt(3, reple.getNum());
				int update = pstmt.executeUpdate();
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {
				re_num = number;
				re_step = 0;
				re_level = 0;
			}
			int renumber = 1;
			String sql2 = "select max(replenum) from reple";
			pstmt = con.prepareStatement(sql2);
			rs2 = pstmt.executeQuery();
			if (rs2.next()) {
				renumber = rs2.getInt(1) + 1;
			} else {
				renumber = 1;
			}

			sql = "INSERT INTO reple (REPLENUM, REPLECONTENT, NUM, USERID, RE_NUM, RE_LEVEL, RE_STEP, REGDATE ) "
					+ "VALUES  ( ?, ? , ?, ?, ?, ?, ? ,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, renumber);
			pstmt.setString(2, reple.getRepleContent());
			pstmt.setInt(3, reple.getNum());
			pstmt.setString(4, reple.getUserid());
			pstmt.setInt(5, re_num);
			pstmt.setInt(6, re_level);
			pstmt.setInt(7, re_step);
			pstmt.setTimestamp(8, reple.getRegdate());
			int insert = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	public int updateReple(RepleDTO reple) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userid = "";
		String sql = "";
		int x = -1;

		try {
			con = pool.getConnection(); 
			pstmt = con.prepareStatement("select userid from reple where replenum=? and num=?");
			pstmt.setInt(1, reple.getRepleNum());
			pstmt.setInt(2, reple.getNum());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				userid = rs.getString("userid");
				if (userid.equals(reple.getUserid())) {
					sql = "update reple set replecontent=? where replenum=? and num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, reple.getRepleContent());
					pstmt.setInt(2, reple.getRepleNum());
					pstmt.setInt(3, reple.getNum());
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

	public int deleteReple(int replenum, String userid, int articlenum, int grant) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user = "";
		String sql = "";
		int x = -1;
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement("select userid from reple where num=? and replenum=?");
			pstmt.setInt(1, articlenum);
			pstmt.setInt(2, replenum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = rs.getString("userid");
				if (user.equals(userid) || grant == 2) {
					sql = "delete from reple where num = ? and replenum=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, articlenum);
					pstmt.setInt(2, replenum);
					int delete = pstmt.executeUpdate();
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
}