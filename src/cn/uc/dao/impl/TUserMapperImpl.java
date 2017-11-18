package cn.uc.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.TUserMapper;
import cn.uc.model.TAdmin;
import cn.uc.model.TUser;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class TUserMapperImpl implements TUserMapper {

	
	@Override
	public int insert(TUser record) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public Result selectByPrimaryKey(Integer id) {
		Result result = new Result();
		SqlSession session = MyBatisUtils.openSession();
		TUser user = session.selectOne(Constants.USERMAPPER_SELECT_BYID, id);
		session.close();
		if(user != null){
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(user);
		}else{
			result.setRetCode(Constants.RETCODE_FAILED);
			result.setRetMsg(false);
		}
		return result;
	}

	@Override
	public Result updateByPrimaryKeySelective(TUser record) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		int row = session.insert(Constants.USERMAPPER_UPDATE, record);
		session.commit();
		session.close();
		if (row > 0) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
		}
		return result;
	}

	@Override
	public int updateByPrimaryKey(TUser record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Result selectUserByLike(String likeStr, int pageNum) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("likeStr", "%"+likeStr+"%");
		params.put("startIndex",Constants.PAGE_SIZE * (pageNum -1));
		params.put("pageSize", Constants.PAGE_SIZE);
		List<TUser> userList = session.selectList(Constants.USERMAPPER_SELECTBYLIKE, params);
		session.close();
		if (userList != null) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(userList);
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
		int counts = session.selectOne(Constants.USERMAPPER_SELECT_COUNT, params);
		session.close();
		//这里无需判断 已经在jsp页面进行最大最小值判断
		result.setRetCode(Constants.RETCODE_SUCCESS);
		result.setRetMsg(true);
		result.setRetData(counts);
		return result;
	}

	@Override
	public Result selectNameById(Integer id) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		String username = session.selectOne(Constants.USERMAPPER_SELECTNAME_BYID, id);
		if (username != null) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(username);
		}
		return result;
	}


	@Override
	public Result deleteByPrimaryKey(Integer id) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		int row = session.delete(Constants.USERMAPPER_DELETE, id);
		session.commit();
		session.close();
		if (row > 0) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
		}
		return result;
	}


	@Override
	public Result insertSelective(TUser record) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		int row = session.insert(Constants.USERMAPPER_INSERT, record);
		session.commit();
		session.close();
		if (row > 0) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
		}
		return result;
	}


	@Override
	public Result selectIdByName(String name) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		Integer id = session.selectOne(Constants.USERMAPPER_SELECTID_BYNAME, name);
		if (id != null) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(id);
		}
		return result;
	}

}
