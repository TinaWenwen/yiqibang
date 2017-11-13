package cn.uc.model;

public class TAdmin {
   
    private Integer id;

    
    private TUser user;

   
    private Boolean state;

  
    private Integer level;

   
    public Integer getId() {
        return id;
    }


	public TUser getUser() {
		return user;
	}


	public void setUser(TUser user) {
		this.user = user;
	}


	public Boolean getState() {
		return state;
	}


	public void setState(Boolean state) {
		this.state = state;
	}


	public Integer getLevel() {
		return level;
	}


	public void setLevel(Integer level) {
		this.level = level;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public TAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}


	public TAdmin(TUser user, Boolean state, Integer level) {
		super();
		this.user = user;
		this.state = state;
		this.level = level;
	}


	@Override
	public String toString() {
		return "TAdmin [id=" + id + ", user=" + user + ", state=" + state + ", level=" + level + "]";
	}

}