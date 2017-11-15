package cn.uc.dao;

import cn.uc.model.TAdmin;
import cn.uc.util.Result;

public interface TAdminMapper {
   
	/*Result selectAllAdmin();*/
	
	//查询(包括查询所有和模糊查询,分页查询）
	Result selectAdminByLike(String likeStr, int pageNum);
	
	//根据查询 得到查询的数据有多少条
	Result selectAllCounts(String likeStr);
	
    int deleteByPrimaryKey(Integer id);

   
    int insert(TAdmin record);

    
    int insertSelective(TAdmin record);

    
    TAdmin selectByPrimaryKey(Integer id);

   
    int updateByPrimaryKeySelective(TAdmin record);

   
    int updateByPrimaryKey(TAdmin record);
}