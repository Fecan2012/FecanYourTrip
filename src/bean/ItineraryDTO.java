package bean;

public class ItineraryDTO {
	private int itid;
	private int daynum;
	private String place;
	private int sid;

	public int getItid() {
		return itid;
	}

	public void setItid(int itid) {
		this.itid = itid;
	}

	public int getDaynum() {
		return daynum;
	}

	public void setDaynum(int daynum) {
		this.daynum = daynum;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}
}