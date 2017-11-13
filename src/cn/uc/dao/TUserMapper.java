package cn.uc.dao;

import cn.uc.model.TUser;
import cn.uc.util.Result;

public interface TUserMapper {
    
	Result selectAllUser();
	
    int deleteByPrimaryKey(Integer id);

    
    int insert(TUser record);

   
    int insertSelective(TUser record);

    
    TUser selectByPrimaryKey(Integer id);

   
    int updateByPrimaryKeySelective(TUser record);

    int updateByPrimaryKey(TUser record);
}