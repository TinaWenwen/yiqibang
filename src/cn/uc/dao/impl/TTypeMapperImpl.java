package cn.uc.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.TTypeMapper;
import cn.uc.model.Areas;
import cn.uc.model.TAdmin;
import cn.uc.model.TType;
import cn.uc.model.TUser;
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
	public Result selectTypeByLike(String likeStr, int pageNum) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("likeStr", "%"+likeStr+"%");
		params.put("startIndex",Constants.PAGE_SIZE * (pageNum -1));
		params.put("pageSize", Constants.PAGE_SIZE);
		List<TType> typeList = session.selectList(Constants.TYPEMAPPER_SELECTBYLIKE, params);
		session.close();
		if (typeList != null) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(typeList);
		}
		return result;
	}

	@Override
	public Result selectAllCounts(String likeStr) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("likeStr", "%"+likeStr+"%");
		int counts = session.selectOne(Constants.TYPEMAPPER_SELECT_COUNT, params);
		session.close();
		//这里无需判断 已经在jsp页面进行最大最小值判断
		result.setRetCode(Constants.RETCODE_SUCCESS);
		result.setRetMsg(true);
		result.setRetData(counts);
		return result;
	}


	@Override
	public Result deleteByPrimaryKey(Integer id) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		int row = session.delete(Constants.TYPEMAPPER_DELETE, id);
		session.commit();
		session.close();
		if (row > 0) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
		}
		return result;
	}


	@Override
	public int insert(TType record) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public Result insertSelective(TType record) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		int row = session.insert(Constants.TYPEMAPPER_INSERT, record);
		session.commit();
		session.close();
		if (row > 0) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
		}
		return result;
	}


	@Override
	public Result selectByPrimaryKey(Integer id) {
		Result result = new Result();
		SqlSession session = MyBatisUtils.openSession();
		TType type = session.selectOne(Constants.TYPEMAPPER_SELECTBYID, id);
		session.close();
		if(type != null){
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(type);
		}else{
			result.setRetCode(Constants.RETCODE_FAILED);
			result.setRetMsg(false);
		}
		return result;
	}


	@Override
	public Result updateByPrimaryKeySelective(TType record) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		int row = session.update(Constants.TYPEMAPPER_UPDATE, record);
		session.commit();
		session.close();
		if (row > 0) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
		}
		return result;
	}


	@Override
	public Result updateByPrimaryKey(TType record) {
		// TODO Auto-generated method stub
		return null;
	}

}
