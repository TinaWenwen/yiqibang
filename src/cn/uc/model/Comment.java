package cn.uc.model;

public class Comment {
	private int id;
	private int newsId;
	private int userId;
	private String content;
	private String commTime;
	private int supportCount;
	private int score;
	private int status;
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int id, int newsId, int userId, String content, String commTime, int supportCount, int score,
			int status) {
		super();
		this.id = id;
		this.newsId = newsId;
		this.userId = userId;
		this.content = content;
		this.commTime = commTime;
		this.supportCount = supportCount;
		this.score = score;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNewsId() {
		return newsId;
	}
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCommTime() {
		return commTime;
	}
	public void setCommTime(String commTime) {
		this.commTime = commTime;
	}
	public int getSupportCount() {
		return supportCount;
	}
	public void setSupportCount(int supportCount) {
		this.supportCount = supportCount;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", newsId=" + newsId + ", userId=" + userId + ", content=" + content
				+ ", commTime=" + commTime + ", supportCount=" + supportCount + ", score=" + score + ", status="
				+ status + "]";
	}
	
	
}
