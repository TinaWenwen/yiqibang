package cn.uc.dao;

import cn.uc.model.TUser;
import cn.uc.util.Result;

public interface TUserMapper {
    
	Result selectUserByLike(String likeStr, int pageNum);
	
	Result selectAllCounts(String likeStr);
	
	Result selectNameById(Integer id);
	
	Result selectIdByName(String name);
	//根据用户验证密码
	Result selectPwdByName(String name);
	
	Result selectByPrimaryKey(Integer id);
	
    Result deleteByPrimaryKey(Integer id);
    
    Result insertSelective(TUser record);

    Result updateByPrimaryKeySelective(TUser record);

    Result userLogin(String username);
    
    Result changeUserPhoto(int id, String headUrl);
    
    int updateByPrimaryKey(TUser record);
    
    int insert(TUser record);
}