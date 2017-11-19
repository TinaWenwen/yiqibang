package cn.uc.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.TCommentMapper;
import cn.uc.model.TAdmin;
import cn.uc.model.TComment;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class TCommentMapperImpl implements TCommentMapper {

	/*@Override
	public Result selectAllComment() {
		Result result = new Result();
		SqlSession session = MyBatisUtils.openSession();
		List<TComment> commList = session.selectList(Constants.COMMMAPPER_SELECTALL);
		session.close();
		if(commList != null){
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(commList);
		}else{
			result.setRetCode(Constants.RETCODE_FAILED);
			result.setRetMsg(false);
		}
		return result;
	}*/

	@Override
	public Result deleteByPrimaryKey(Integer id) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		int row = session.delete(Constants.COMMMAPPER_DELETE, id);
		session.commit();
		session.close();
		if (row > 0) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
		}
		return result;
	}

	@Override
	public int insert(TComment record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(TComment record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Result selectByPrimaryKey(Integer id) {
		Result result = new Result();
		SqlSession session = MyBatisUtils.openSession();
		TComment comm = session.selectOne(Constants.COMMMAPPER_SELECTBYID,id);
		session.close();
		if(comm != null){
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(comm);
		}else{
			result.setRetCode(Constants.RETCODE_FAILED);
			result.setRetMsg(false);
		}
		return result;
	}

	@Override
	public Result updateByPrimaryKeySelective(TComment record) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		int row = session.update(Constants.COMMMAPPER_UPDATE, record);
		session.commit();
		session.close();
		if (row > 0) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
		}
		return result;
	}

	@Override
	public int updateByPrimaryKey(TComment record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Result selectByLike(String likeStr, int pageNum) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("likeStr", "%"+likeStr+"%");
		params.put("startIndex",Constants.PAGE_SIZE * (pageNum -1));
		params.put("pageSize", Constants.PAGE_SIZE);
		List<TComment> commList = session.selectList(Constants.COMMMAPPER_SELECTBYLIKE, params);
		session.close();
		if (commList != null) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(commList);
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
		int counts = session.selectOne(Constants.COMMMAPPER_SELECT_COUNT, params);
		session.close();
		//这里无需判断 已经在jsp页面进行最大最小值判断
		result.setRetCode(Constants.RETCODE_SUCCESS);
		result.setRetMsg(true);
		result.setRetData(counts);
		return result;
	}

}
