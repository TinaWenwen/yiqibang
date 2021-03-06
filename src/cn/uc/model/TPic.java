package cn.uc.model;

public class TPic {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_pic.id
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_pic.n_id
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    private Integer nId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_pic.path
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    private String path;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_pic.info
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    private String info;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_pic.author
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    private String author;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_pic.source
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    private String source;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_pic.id
     *
     * @return the value of t_pic.id
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_pic.id
     *
     * @param id the value for t_pic.id
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_pic.n_id
     *
     * @return the value of t_pic.n_id
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    public Integer getnId() {
        return nId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_pic.n_id
     *
     * @param nId the value for t_pic.n_id
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    public void setnId(Integer nId) {
        this.nId = nId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_pic.path
     *
     * @return the value of t_pic.path
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    public String getPath() {
        return path;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_pic.path
     *
     * @param path the value for t_pic.path
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_pic.info
     *
     * @return the value of t_pic.info
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    public String getInfo() {
        return info;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_pic.info
     *
     * @param info the value for t_pic.info
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    public void setInfo(String info) {
        this.info = info == null ? null : info.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_pic.author
     *
     * @return the value of t_pic.author
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    public String getAuthor() {
        return author;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_pic.author
     *
     * @param author the value for t_pic.author
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_pic.source
     *
     * @return the value of t_pic.source
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    public String getSource() {
        return source;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_pic.source
     *
     * @param source the value for t_pic.source
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

	public TPic() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TPic(Integer nId, String path, String info, String author, String source) {
		super();
		this.nId = nId;
		this.path = path;
		this.info = info;
		this.author = author;
		this.source = source;
	}

	@Override
	public String toString() {
		return "TPic [id=" + id + ", nId=" + nId + ", path=" + path + ", info=" + info + ", author=" + author
				+ ", source=" + source + "]";
	}
    
    
}