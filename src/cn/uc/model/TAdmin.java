package cn.uc.model;

public class TAdmin {
   
    private Integer id;

    
    private Integer uId;

   
    private Boolean state;

  
    private Integer level;

   
    public Integer getId() {
        return id;
    }

   
    public void setId(Integer id) {
        this.id = id;
    }

    
    public Integer getuId() {
        return uId;
    }

    
    public void setuId(Integer uId) {
        this.uId = uId;
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

	public TAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TAdmin(Integer uId, Boolean state, Integer level) {
		super();
		this.uId = uId;
		this.state = state;
		this.level = level;
	}


	@Override
	public String toString() {
		return "TAdmin [id=" + id + ", uId=" + uId + ", state=" + state + ", level=" + level + "]";
	}
    
    
}