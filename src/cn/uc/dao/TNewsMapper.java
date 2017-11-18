package cn.uc.dao;

import cn.uc.model.NewsMap;
import cn.uc.model.TNews;
import cn.uc.util.Result;

public interface TNewsMapper {


	Result selectAllNews();
	
	Result selectNewsByLike(String likeStr, int pageNum);
	
	Result selectAllCounts(String likeStr);
	
    Result deleteByPrimaryKey(Integer id);

    Result insertSelective(NewsMap record);
    
    int insert(TNews record);
   
    TNews selectByPrimaryKey(Integer id);

    
    int updateByPrimaryKeySelective(TNews record);

  
    int updateByPrimaryKeyWithBLOBs(TNews record);

   
    int updateByPrimaryKey(TNews record);
}