package bean;

public class MemberDTO {

	private String user_id;
	private String user_email;
	private String user_passwd;
	private int grade;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_passwd() {
		return user_passwd;
	}

	public void setUser_passwd(String user_passwd) {
		this.user_passwd = user_passwd;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
}