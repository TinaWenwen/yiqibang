package cn.uc.model;

import java.util.Date;

public class TUser {
    
    private Integer id;
 
    private String username;

    private String nickname;

    private String password;

    private Boolean sex;
 
    private String bindtel;

    private String email;
 
    private String headimg;

    private Boolean state;

    private Date createtime;

    private String birthday;
  
    private String remark;
 
    private Date update;

    private String address;
    
    public Integer getId() {
        return id;
    }

    
    public void setId(Integer id) {
        this.id = id;
    }

    
    public String getUsername() {
        return username;
    }

    
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    
    public String getNickname() {
        return nickname;
    }

    
    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getPassword() {
        return password;
    }

    
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    
    public Boolean getSex() {
        return sex;
    }

   
    public void setSex(Boolean sex) {
        this.sex = sex;
    }

   
    public String getBindtel() {
        return bindtel;
    }

   
    public void setBindtel(String bindtel) {
        this.bindtel = bindtel == null ? null : bindtel.trim();
    }

    
    public String getEmail() {
        return email;
    }

    
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getHeadimg() {
        return headimg;
    }

   
    public void setHeadimg(String headimg) {
        this.headimg = headimg == null ? null : headimg.trim();
    }

    
    public Boolean getState() {
        return state;
    }

    
    public void setState(Boolean state) {
        this.state = state;
    }

    
    public Date getCreatetime() {
        return createtime;
    }

   
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    
    public String getBirthday() {
        return birthday;
    }

    
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    
    public String getRemark() {
        return remark;
    }

    
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    
    public Date getUpdate() {
        return update;
    }

    
    public void setUpdate(Date update) {
        this.update = update;
    }

    

	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public TUser() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	public String toString() {
		return "TUser [id=" + id + ", username=" + username + ", nickname=" + nickname + ", password=" + password
				+ ", sex=" + sex + ", bindtel=" + bindtel + ", email=" + email + ", headimg=" + headimg + ", state="
				+ state + ", createtime=" + createtime + ", birthday=" + birthday + ", remark=" + remark + ", update="
				+ update + ", address=" + address + "]";
	}

    
}