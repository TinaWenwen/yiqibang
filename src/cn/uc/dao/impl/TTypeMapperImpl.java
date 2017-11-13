package cn.uc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.TTypeMapper;
import cn.uc.model.Areas;
import cn.uc.model.TType;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class TTypeMapperImpl implements TTypeMapper {

	@Override
	public Result selectAllType() {
		Result result = new Result();
		SqlSession session = MyBatisUtils.openSession();
		List<TType> typeList = session.selectList(Constants.TYPEMAPPER_SELECTALL);
		session.close();
		if(typeList != null){
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(typeList);
		}else{
			result.setRetCode(Constants.RETCODE_FAILED);
			result.setRetMsg(false);
		}
		return result;
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(TType record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(TType record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TType selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(TType record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(TType record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
