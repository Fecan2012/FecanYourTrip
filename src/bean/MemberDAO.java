package bean;

import java.sql.*;
import java.util.*;

public class MemberDAO {
	private DBConnectionMgr pool = null;

	public MemberDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
			System.out.println("pool=" + pool);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public HashMap<String, String> usersIdEmail() {
		HashMap<String, String> usrIdEmail = new HashMap<String, String>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();
			String sql = "select userid, email from users";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					usrIdEmail.put(rs.getString("userid"), rs.getString("email"));
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println(" usersIdEmail() error");
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return usrIdEmail;
	}

	public boolean loginCheck(String id, String passwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		String sql = null;

		try {
			con = pool.getConnection();
			sql = "select userid,passwd from users where userid=? and passwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			check = rs.next();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return check;
	}

	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		String sql = "";

		try {
			con = pool.getConnection();
			sql = "select userid from users where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			check = rs.next();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return check;
	}

	public boolean memberInsert(MemberDTO mem) {

		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		String sql = "";

		try {
			con = pool.getConnection();
			con.setAutoCommit(false);
			sql = "insert into users values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem.getUser_id());
			pstmt.setString(2, mem.getUser_email());
			pstmt.setString(3, mem.getUser_passwd());
			pstmt.setString(4, "2");
			int insert = pstmt.executeUpdate();
			con.commit();
			if (insert > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	public boolean deleteMember(String usrId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		String sql = "";
		try {
			con = pool.getConnection();
			sql = "delete from users where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, usrId);
			int delUsr = pstmt.executeUpdate();
			if (delUsr > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	public int changeMem(String userid, String pass, String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		String sql = null;

		try {
			con = pool.getConnection();
			sql = "update users set passwd=?,email=? where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, email);
			pstmt.setString(3, userid);
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return check;
	}

	public List getUsers() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List memList = null;
		try {
			con = pool.getConnection();
			String sql = "select * from users order by authority desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memList = new ArrayList();
				do {
					MemberDTO mem = new MemberDTO();
					mem.setUser_id(rs.getString("userid"));
					mem.setUser_passwd(rs.getString("passwd"));
					mem.setUser_email(rs.getString("email"));
					mem.setGrade(Integer.parseInt(rs.getString("authority")));
					memList.add(mem);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return memList;
	}

	public MemberDTO getMember(String mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO mem = null;
		String sql = "";
		try {
			con = pool.getConnection();
			sql = "select * from users where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mem = new MemberDTO();
				mem.setUser_id(rs.getString("userid"));
				mem.setUser_passwd(rs.getString("passwd"));
				mem.setUser_email(rs.getString("email"));
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return mem;
	}
}