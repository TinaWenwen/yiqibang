package cn.uc.model;

public class Provinces {
	private int id;
	private String provinceId;
	private String province;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	
	@Override
	public String toString() {
		return "Provinces [id=" + id + ", provinceId=" + provinceId + ", province=" + province + "]";
	}
	
	
}
