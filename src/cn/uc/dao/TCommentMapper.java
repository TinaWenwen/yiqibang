package cn.uc.dao;

import cn.uc.model.TComment;
import cn.uc.util.Result;

public interface TCommentMapper {

	
	Result selectByLike(String likeStr, int pageNum);
	
	Result selectAllCounts(String likeStr);
	
    int deleteByPrimaryKey(Integer id);

   
    int insert(TComment record);

    
    int insertSelective(TComment record);

   
    TComment selectByPrimaryKey(Integer id);

    
    int updateByPrimaryKeySelective(TComment record);

    
    int updateByPrimaryKey(TComment record);
}