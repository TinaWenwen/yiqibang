package cn.uc.dao;

import cn.uc.util.Result;

public interface ProvincesMapper {
    
	Result selectProvinceById(String provinceid);
	
	Result selectAll();
    
}