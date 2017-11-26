package cn.uc.dao;

import cn.uc.model.TComment;
import cn.uc.util.Result;

public interface TCommentMapper {

	
	Result selectByLike(String likeStr, int pageNum);
	
	Result selectAllCounts(String likeStr);
	
	Result deleteByPrimaryKey(Integer id);

    Result selectByNewsid(int newsid);
	
    int insert(TComment record);

    Result insertComment(int nid, int uid, String content);
    
    Result selectLatestComment(int newsid);
    
    int insertSelective(TComment record);

   
    Result selectByPrimaryKey(Integer id);

    
    Result updateByPrimaryKeySelective(TComment record);

    
    int updateByPrimaryKey(TComment record);
}