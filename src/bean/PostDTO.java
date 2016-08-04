package bean;

public class PostDTO {
	private int postid;
	private String title;
	private String imgpath;
	private String comments;
	private String itinerary;
	private float raitings;
	private int ratenum;

	public int getRatenum() {
		return ratenum;
	}

	public void setRatenum(int ratenum) {
		this.ratenum = ratenum;
	}

	public int getPostid() {
		return postid;
	}

	public void setPostid(int postid) {
		this.postid = postid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getItinerary() {
		return itinerary;
	}

	public void setItinerary(String itinerary) {
		this.itinerary = itinerary;
	}

	public float getRaitings() {
		return raitings;
	}

	public void setRaitings(float raitings) {
		this.raitings = raitings;
	}
}