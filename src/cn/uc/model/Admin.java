package cn.uc.model;

public class Admin {
	private int id;
	private int level; //
	private int status;
	private int userId;
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(int id, int level, int status, int userId) {
		super();
		this.id = id;
		this.level = level;
		this.status = status;
		this.userId = userId;
	}
	
	
	public Admin(int level, int status, int userId) {
		super();
		this.level = level;
		this.status = status;
		this.userId = userId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "Admin [id=" + id + ", level=" + level + ", status=" + status + ", userId=" + userId + "]";
	}
	
}
