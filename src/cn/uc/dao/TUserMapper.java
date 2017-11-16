package cn.uc.dao;

import cn.uc.model.TUser;
import cn.uc.util.Result;

public interface TUserMapper {
    
	Result selectUserByLike(String likeStr, int pageNum);
	
	Result selectAllCounts(String likeStr);
	
	Result selectNameById(Integer id);
	
    int deleteByPrimaryKey(Integer id);

    
    int insert(TUser record);

   
    int insertSelective(TUser record);

    
    Result selectByPrimaryKey(Integer id);
   
    int updateByPrimaryKeySelective(TUser record);

    int updateByPrimaryKey(TUser record);
}