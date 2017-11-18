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


	public final Integer getId() {
		return id;
	}


	public final void setId(Integer id) {
		this.id = id;
	}


	public final int gettypeId() {
		return typeId;
	}


	public final void setTypeid(int typeId) {
		this.typeId = typeId;
	}


	public final String getTitle() {
		return title;
	}


	public final void setTitle(String title) {
		this.title = title;
	}


	public final String getSource() {
		return source;
	}


	public final void setSource(String source) {
		this.source = source;
	}


	public final Date getCreatetime() {
		return createtime;
	}


	public final void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}


	public final Integer getCommcount() {
		return commcount;
	}


	public final void setCommcount(Integer commcount) {
		this.commcount = commcount;
	}


	public final Integer getReadcount() {
		return readcount;
	}


	public final void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}


	public final String getAuthor() {
		return author;
	}


	public final void setAuthor(String author) {
		this.author = author;
	}


	public final Integer getSharecount() {
		return sharecount;
	}


	public final void setSharecount(Integer sharecount) {
		this.sharecount = sharecount;
	}


	public final Boolean getIfhot() {
		return ifhot;
	}


	public final void setIfhot(Boolean ifhot) {
		this.ifhot = ifhot;
	}


	public final Boolean getIfreport() {
		return ifreport;
	}


	public final void setIfreport(Boolean ifreport) {
		this.ifreport = ifreport;
	}


	public final String getContent() {
		return content;
	}


	public final void setContent(String content) {
		this.content = content;
	}
    
    
}
