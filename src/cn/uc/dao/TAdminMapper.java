package cn.uc.dao;

import cn.uc.model.TAdmin;
import cn.uc.util.Result;

public interface TAdminMapper {
   
	
	//查询(包括查询所有和模糊查询,分页查询）
	Result selectAdminByLike(String likeStr, int pageNum);
	
	//根据查询 得到查询的数据有多少条
	Result selectAllCounts(String likeStr);
	
	Result insertSelective(int uid, boolean state, int level);
	
    Result deleteByPrimaryKey(Integer id);

    Result selectByUid(int uid);

    Result selectAdminByUid(int uid);
    
    Result selectByPrimaryKey(Integer id);

    Result updateByPrimaryKeySelective(int id, int uid, boolean state, int level);
    
    Result adminUsernameCheck(String username);
    
    int insert(TAdmin record);
    
    int updateByPrimaryKey(TAdmin record);
}