package cn.uc.model;

public class Cities {
	private int id;
	private String cityId;
	private String city;
	private String privinceId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPrivinceId() {
		return privinceId;
	}
	public void setPrivinceId(String privinceId) {
		this.privinceId = privinceId;
	}
	
	@Override
	public String toString() {
		return "Cities [id=" + id + ", cityId=" + cityId + ", city=" + city + ", privinceId=" + privinceId + "]";
	}
	
}
