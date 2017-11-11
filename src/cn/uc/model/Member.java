package cn.uc.model;

import java.util.Date;

public class Member {

	private int id;
	private String userName;
	private String nickName;
	private String passWord;
	private int sex;
	private String phone;
	private String email;
	private String headImg;
	private int status;
	private Date createTime;
	private Date birthday;
	private String remark;
	private Date updateTime;
	private int provinceId;
	private int cityId;
	private int areaId;
	private boolean isAdmin;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(int id, String userName, String nickName, String passWord, int sex, String phone, String email,
			String headImg, int status, Date createTime, Date birthday, String remark, Date updateTime, int provinceId,
			int cityId, int areaId, boolean isAdmin) {
		super();
		this.id = id;
		this.userName = userName;
		this.nickName = nickName;
		this.passWord = passWord;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
		this.headImg = headImg;
		this.status = status;
		this.createTime = createTime;
		this.birthday = birthday;
		this.remark = remark;
		this.updateTime = updateTime;
		this.provinceId = provinceId;
		this.cityId = cityId;
		this.areaId = areaId;
		this.isAdmin = isAdmin;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public int getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public int getAreaId() {
		return areaId;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", userName=" + userName + ", nickName=" + nickName + ", passWord=" + passWord
				+ ", sex=" + sex + ", phone=" + phone + ", email=" + email + ", headImg=" + headImg + ", status="
				+ status + ", createTime=" + createTime + ", birthday=" + birthday + ", remark=" + remark
				+ ", updateTime=" + updateTime + ", provinceId=" + provinceId + ", cityId=" + cityId + ", areaId="
				+ areaId + ", isAdmin=" + isAdmin + "]";
	}

}
