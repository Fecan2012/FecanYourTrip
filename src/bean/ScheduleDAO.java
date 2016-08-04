package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

public class ScheduleDAO {

	private DBConnectionMgr pool = null;

	public ScheduleDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error:Connection Fail!");
		}
	}

	public int getScheduleCountById(String userid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;

		try {
			con = pool.getConnection();
			String sql = "select count(*) from schedule where userid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
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
		int pageSize = 6;
		int blockSize = 5;
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

	public List getSchedulesById(int start, int end, int pagesize, String userid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List scheduleList = null;
		String sql = "";

		try {
			con = pool.getConnection();
			setOrderNum(userid);
			sql = "select * from (select sid,title," + "imgpath,startdate,"
					+ "enddate,userid,regdate,ordernum,days,descrip from (select * from schedule where userid = ? "
					+ "order by ordernum desc)) where ordernum>=? and ordernum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				scheduleList = new ArrayList(pagesize);
				do {
					ScheduleDTO schedule = new ScheduleDTO();
					schedule.setSid(rs.getInt("sid"));
					schedule.setTitle(rs.getString("title"));
					schedule.setImgpath(rs.getString("imgpath"));
					schedule.setStartdate(rs.getDate("startdate"));
					schedule.setEnddate(rs.getDate("enddate"));
					schedule.setUserid(rs.getString("userid"));
					schedule.setRegdate(rs.getTimestamp("regdate"));
					schedule.setDays(rs.getInt("days"));
					schedule.setDescrip(rs.getString("descrip"));
					scheduleList.add(schedule);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return scheduleList;
	}

	public int insertSchedule(ScheduleDTO schedule) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		int number = 0;
		String sql = "";

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement("select max(sid) from schedule");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt("max(sid)") + 1;
			} else {
				number = 1;
			}
			sql = "insert into schedule(sid,title,imgpath," + " startdate, enddate,userid,regdate,days,descrip) values"
					+ "(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, schedule.getTitle());
			pstmt.setString(3, schedule.getImgpath());
			pstmt.setDate(4, schedule.getStartdate());
			pstmt.setDate(5, schedule.getEnddate());
			pstmt.setString(6, schedule.getUserid());
			pstmt.setTimestamp(7, schedule.getRegdate());
			pstmt.setInt(8, schedule.getDays());
			pstmt.setString(9, schedule.getDescrip());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return result;
	}

	public ScheduleDTO getSchedule(String userid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ScheduleDTO schedule = null;

		try {
			con = pool.getConnection();
			String sql = "select * from schedule where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				schedule = new ScheduleDTO();
				schedule.setSid(rs.getInt("sid"));
				schedule.setTitle(rs.getString("title"));
				schedule.setImgpath(rs.getString("imgpath"));
				schedule.setStartdate(rs.getDate("startdate"));
				schedule.setEnddate(rs.getDate("enddate"));
				schedule.setUserid(rs.getString("userid"));
				schedule.setRegdate(rs.getTimestamp("regdate"));
				schedule.setOrdernum(rs.getInt("ordernum"));
				schedule.setDays(rs.getInt("days"));
				schedule.setDescrip(rs.getString("descrip"));
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return schedule;
	}

	public ScheduleDTO getScheduleBySid(int sid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ScheduleDTO schedule = null;

		try {
			con = pool.getConnection();
			String sql = "select * from schedule where sid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				schedule = new ScheduleDTO();
				schedule.setSid(rs.getInt("sid"));
				schedule.setTitle(rs.getString("title"));
				schedule.setImgpath(rs.getString("imgpath"));
				schedule.setStartdate(rs.getDate("startdate"));
				schedule.setEnddate(rs.getDate("enddate"));
				schedule.setUserid(rs.getString("userid"));
				schedule.setRegdate(rs.getTimestamp("regdate"));
				schedule.setOrdernum(rs.getInt("ordernum"));
				schedule.setDays(rs.getInt("days"));
				schedule.setDescrip(rs.getString("descrip"));
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return schedule;
	}

	public int updateSchedule(ScheduleDTO schedule) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int x = -1;

		try {
			con = pool.getConnection();
			sql = "update schedule set startdate=?,enddate=? where userid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, schedule.getStartdate());
			pstmt.setDate(2, schedule.getEnddate());
			pstmt.setString(3, schedule.getUserid());
			int update = pstmt.executeUpdate();
			x = 1;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}

	public int deleteSchedule(String userid, int sid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int x = -1;

		try {
			con = pool.getConnection();
			sql = "delete from schedule where userid = ? and sid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, sid);
			int delete = pstmt.executeUpdate();
			x = 1;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}

	public void setOrderNum(String userid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement("update schedule s set ordernum = (select ordnum "
					+ "from (select sid,row_number() over(order by sid) ordnum from "
					+ "schedule where userid = ?) sub where s.sid = sub.sid) ");
			pstmt.setString(1, userid);
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