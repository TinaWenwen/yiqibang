package cn.uc.model;

import java.util.Date;

public class News {
	private int id;
	private int typeId;
	private String title;
	private String source;
	private String content;
	private Date createTime;
	private int commCount;
	private int readCount;
	private String author;
	private int shareCount;
	private boolean ifHot;
	private boolean ifReport;
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}
	public News(int id, int typeId, String title, String source, String content, Date createTime, int commCount,
			int readCount, String author, int shareCount, boolean ifHot, boolean ifReport) {
		super();
		this.id = id;
		this.typeId = typeId;
		this.title = title;
		this.source = source;
		this.content = content;
		this.createTime = createTime;
		this.commCount = commCount;
		this.readCount = readCount;
		this.author = author;
		this.shareCount = shareCount;
		this.ifHot = ifHot;
		this.ifReport = ifReport;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getCommCount() {
		return commCount;
	}
	public void setCommCount(int commCount) {
		this.commCount = commCount;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getShareCount() {
		return shareCount;
	}
	public void setShareCount(int shareCount) {
		this.shareCount = shareCount;
	}
	public boolean isIfHot() {
		return ifHot;
	}
	public void setIfHot(boolean ifHot) {
		this.ifHot = ifHot;
	}
	public boolean isIfReport() {
		return ifReport;
	}
	public void setIfReport(boolean ifReport) {
		this.ifReport = ifReport;
	}
	@Override
	public String toString() {
		return "News [id=" + id + ", typeId=" + typeId + ", title=" + title + ", source=" + source + ", content="
				+ content + ", createTime=" + createTime + ", commCount=" + commCount + ", readCount=" + readCount
				+ ", author=" + author + ", shareCount=" + shareCount + ", ifHot=" + ifHot + ", ifReport=" + ifReport
				+ "]";
	}
	
}
