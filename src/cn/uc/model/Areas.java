package cn.uc.model;

public class Areas {
	private int id;
	private String areaId;
	private String area;
	private String cityId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAreaId() {
		return areaId;
	}
	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	@Override
	public String toString() {
		return "Areas [id=" + id + ", areaId=" + areaId + ", area=" + area + ", cityId=" + cityId + "]";
	}
	
	
}
