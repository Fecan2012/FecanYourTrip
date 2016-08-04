package bean;

import java.sql.Timestamp;

public class RepleDTO {
	private int RepleNum;
	private String repleContent;
	private int num;
	private String userid;
	private Timestamp regdate;
	private int re_num;
	private int re_level;
	private int re_step;
	public int getRepleNum() {
		return RepleNum;
	}
	public void setRepleNum(int repleNum) {
		RepleNum = repleNum;
	}
	public String getRepleContent() {
		return repleContent;
	}
	public void setRepleContent(String repleContent) {
		this.repleContent = repleContent;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
}