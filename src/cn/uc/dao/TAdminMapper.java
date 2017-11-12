package cn.uc.dao;

import cn.uc.model.TAdmin;
import cn.uc.util.Result;

public interface TAdminMapper {
   
	Result selectAllAdmin();
	
    int deleteByPrimaryKey(Integer id);

   
    int insert(TAdmin record);

    
    int insertSelective(TAdmin record);

    
    TAdmin selectByPrimaryKey(Integer id);

   
    int updateByPrimaryKeySelective(TAdmin record);

   
    int updateByPrimaryKey(TAdmin record);
}