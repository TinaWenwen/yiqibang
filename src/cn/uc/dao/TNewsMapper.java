package cn.uc.dao;

import cn.uc.model.NewsMap;
import cn.uc.model.TNews;
import cn.uc.util.Result;

public interface TNewsMapper {


	Result selectAllNews();
	
	Result selectNewsByLike(String likeStr, int pageNum);
	
	Result selectAllCounts(String likeStr);
	
	Result selectNewsByTypeId(int typeid);
	
    Result deleteByPrimaryKey(Integer id);

    Result insertSelective(NewsMap record);

    Result selectByPrimaryKey(Integer id);

    Result updateByPrimaryKeySelective(NewsMap record);

    int insert(TNews record);
    
    int updateByPrimaryKeyWithBLOBs(TNews record);
    
    public void updateReadCounts(int id);
    
    public void addCommentCounts(int id);
   
    int updateByPrimaryKey(TNews record);
}