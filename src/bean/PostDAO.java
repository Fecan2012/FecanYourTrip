package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PostDAO {

	private DBConnectionMgr pool = null;

	// DBConnectionMgr Class
	public PostDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error:Connection Fail!");
		}
	}

	public boolean postCheck(String imgPath) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		String sql = null;

		try {
			con = pool.getConnection();
			sql = "select title from post where imgpath=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, imgPath);
			rs = pstmt.executeQuery();
			check = rs.next();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return check;
	}

	public int changeRaiting(String path, float raiting, int rateNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		String sql = null;

		try {
			con = pool.getConnection();
			System.out.println("con=" + con);
			sql = "update post set raitings=?, ratenum=? where imgpath=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setFloat(1, raiting);
			pstmt.setInt(2, rateNum);
			pstmt.setString(3, path);
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return check;
	}

	public PostDTO getPost(String imgPath) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PostDTO post = null;
		String sql = "";

		try {
			con = pool.getConnection();
			sql = "select * from post where imgpath=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, imgPath);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				post = new PostDTO();
				post.setPostid(rs.getInt("postid"));
				post.setTitle(rs.getString("title"));
				post.setImgpath(rs.getString("imgpath"));
				post.setComments(rs.getString("comments"));
				post.setItinerary(rs.getString("itinerary"));
				post.setRaitings(rs.getFloat("raitings"));
				post.setRatenum(rs.getInt("ratenum"));
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return post;
	}
}