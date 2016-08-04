package bean;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Hashtable;

public class ItineraryDAO {
	private DBConnectionMgr pool = null;

	public ItineraryDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error");
		}
	}

	public int getItinerayCount(int sid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;

		try {
			con = pool.getConnection();
			String sql = "select count(*) from itinerary where sid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sid);
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

	public boolean getItinerayCountByDay(int sid, int day) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean chk = false;

		try {
			con = pool.getConnection();
			String sql = "select count(*) from itinerary where sid=? and daynum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sid);
			pstmt.setInt(2, day);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int x = rs.getInt("count(*)");
				if (x != 0) {
					chk = true;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return chk;
	}

	public Hashtable getItineraies(int sid) {
		Hashtable<Integer, ItineraryDTO> itineraryHash = new Hashtable<Integer, ItineraryDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			String sql = "select * from itinerary where sid=? order by daynum";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					ItineraryDTO itineray = new ItineraryDTO();
					itineray.setItid(rs.getInt("itid"));
					itineray.setDaynum(rs.getInt("daynum"));
					itineray.setPlace(rs.getString("place"));
					itineray.setSid(rs.getInt("sid"));
					itineraryHash.put(rs.getInt("daynum"), itineray);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return itineraryHash;
	}

	public ItineraryDTO getItinerary(int sid, int dayNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ItineraryDTO itinerary = new ItineraryDTO();
		try {
			con = pool.getConnection();
			String sql = "select * from itinerary where sid=? and daynum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sid);
			pstmt.setInt(2, dayNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				itinerary.setItid(rs.getInt("itid"));
				itinerary.setDaynum(dayNum);
				itinerary.setPlace(rs.getString("place"));
				itinerary.setSid(sid);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return itinerary;
	}

	public void insertItineray(ItineraryDTO itineray) {
		Connection con = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select max(itid) from itinerary");

			int orderNum = 1;
			if (rs.next()) {
				orderNum = rs.getInt(1) + 1;
			} else {
				orderNum = 1;
			}

			sql = "INSERT INTO itinerary VALUES  (?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, orderNum);
			pstmt.setInt(2, itineray.getDaynum());
			pstmt.setString(3, itineray.getPlace());
			pstmt.setInt(4, itineray.getSid());
			int insert = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	public int updateItineray(ItineraryDTO itinerary) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int update = 0;

		try {
			con = pool.getConnection();
			sql = "update itinerary set place=? where itid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, itinerary.getPlace());
			pstmt.setInt(2, itinerary.getItid());
			update = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return update;
	}

	public int deleteItineray(int sid, int dayNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int delete = 0;
		try {
			con = pool.getConnection();
			sql = "delete from itinerary where sid=? and daynum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sid);
			pstmt.setInt(2, dayNum);
			delete = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return delete;
	}
}