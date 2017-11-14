package cn.uc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.TNewsMapper;
import cn.uc.model.TNews;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class TNewsMapperImpl implements TNewsMapper {

	@Override
	public Result selectAllNews() {
		Result result = new Result();
		SqlSession session = MyBatisUtils.openSession();
		List<TNews> newsList = session.selectList(Constants.NEWSMAPPER_SELECTALL);
		session.close();
		if(newsList != null){
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(newsList);
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
	public int insert(TNews record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(TNews record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TNews selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(TNews record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeyWithBLOBs(TNews record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(TNews record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
