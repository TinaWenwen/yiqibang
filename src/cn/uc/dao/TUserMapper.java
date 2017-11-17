package cn.uc.dao;

import cn.uc.model.TUser;
import cn.uc.util.Result;

public interface TUserMapper {
    
	Result selectUserByLike(String likeStr, int pageNum);
	
	Result selectAllCounts(String likeStr);
	
	Result selectNameById(Integer id);
	
	Result selectIdByName(String name);
	
	Result selectByPrimaryKey(Integer id);
	
    Result deleteByPrimaryKey(Integer id);
    
    Result insertSelective(TUser record);
 
    int insert(TUser record);

    int updateByPrimaryKeySelective(TUser record);

    int updateByPrimaryKey(TUser record);
}