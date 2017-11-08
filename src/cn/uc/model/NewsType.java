package cn.uc.model;

public class NewsType {
	private int id;
	private String name;
	public NewsType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NewsType(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "NewsType [id=" + id + ", name=" + name + "]";
	}
	
	
}
