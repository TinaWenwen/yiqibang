package cn.uc.dao;

import cn.uc.model.TComment;
import cn.uc.util.Result;

public interface TCommentMapper {

	
	Result selectByLike(String likeStr, int pageNum);
	
	Result selectAllCounts(String likeStr);
	
	Result deleteByPrimaryKey(Integer id);

   
    int insert(TComment record);

    
    int insertSelective(TComment record);

   
    Result selectByPrimaryKey(Integer id);

    
    Result updateByPrimaryKeySelective(TComment record);

    
    int updateByPrimaryKey(TComment record);
}