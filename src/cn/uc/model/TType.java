package cn.uc.model;

import java.util.Date;

public class TType {
   
    private Integer id;

   
    private String name;

    private Date createtime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public TType(String name) {
		super();
		this.name = name;
	}

	
	public TType() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public TType(String name, Date createtime) {
		super();
		this.name = name;
		this.createtime = createtime;
	}

	@Override
	public String toString() {
		return "TType [id=" + id + ", name=" + name + ", createtime=" + createtime + "]";
	}

	
    
    
}