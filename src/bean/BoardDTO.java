package bean;

import java.sql.*;

public class BoardDTO {
	private int num;
	private String content;
	private Timestamp regdate;
	private String subject;
	private int readcount;
	private String userid;
	private int ordernum;
	private int replecount;
	
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp timestamp) {
		this.regdate = timestamp;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readCount) {
		this.readcount = readCount;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getReplecount() {
		return replecount;
	}
	public void setReplecount(int replecount) {
		this.replecount = replecount;
	}	
}