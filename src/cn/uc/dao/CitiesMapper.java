package cn.uc.dao;

import cn.uc.util.Result;

public interface CitiesMapper {
    
	Result selectCityById(String cityId);
	
	Result selectAll();

}