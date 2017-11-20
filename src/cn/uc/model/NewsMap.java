package cn.uc.model;

import java.util.Date;

public class NewsMap {
	
	private Integer id;

	   
    private int typeId;

   
    private String title;

    
    private String source;

    
    private Date createtime;

    
    private Integer commcount;

   
    private Integer readcount;

    
    private String author;

    
    private Integer sharecount;

    
    private Boolean ifhot;

   
    private Boolean ifreport;

    
    private String content;

    private String pic;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Integer getCommcount() {
		return commcount;
	}

	public void setCommcount(Integer commcount) {
		this.commcount = commcount;
	}

	public Integer getReadcount() {
		return readcount;
	}

	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Integer getSharecount() {
		return sharecount;
	}

	public void setSharecount(Integer sharecount) {
		this.sharecount = sharecount;
	}

	public Boolean getIfhot() {
		return ifhot;
	}

	public void setIfhot(Boolean ifhot) {
		this.ifhot = ifhot;
	}

	public Boolean getIfreport() {
		return ifreport;
	}

	public void setIfreport(Boolean ifreport) {
		this.ifreport = ifreport;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
     
}
