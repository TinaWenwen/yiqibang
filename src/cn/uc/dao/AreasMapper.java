package cn.uc.dao;

import cn.uc.util.Result;

public interface AreasMapper {
   
	Result selectAreaByAreaId(String areaid);
	
	Result selectAll();
}