package cn.uc.dao;

import cn.uc.model.TType;
import cn.uc.util.Result;

public interface TTypeMapper {


	Result selectAllType();

	Result selectTypeByLike(String likeStr, int pageNum);
	
	Result selectAllCounts(String likeStr);
	
	Result deleteByPrimaryKey(Integer id);

    int insert(TType record);

    Result insertSelective(TType record);
    
    TType selectByPrimaryKey(Integer id);

    Result updateByPrimaryKeySelective(TType record);

    Result updateByPrimaryKey(TType record);
}