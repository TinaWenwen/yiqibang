package cn.uc.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.TAdminMapper;
import cn.uc.model.TAdmin;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class TAdminMapperImpl implements TAdminMapper {

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(TAdmin record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(TAdmin record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TAdmin selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(TAdmin record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(TAdmin record) {
		// TODO Auto-generated method stub
		return 0;
	}

	/*@Override
	public Result selectAllAdmin() {
		Result result = new Result();
		SqlSession session = MyBatisUtils.openSession();
		List<TAdmin> adminList = session.selectList(Constants.ADMINMAPPER_SELECTALL);
		session.close();
		if(adminList != null){
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(adminList);
		}else{
			result.setRetCode(Constants.RETCODE_FAILED);
			result.setRetMsg(false);
		}
		return result;
	}
*/
	@Override
	public Result selectAdminByLike(String likeStr, int pageNum) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("likeStr", "%"+likeStr+"%");
		params.put("startIndex",Constants.PAGE_SIZE * (pageNum -1));
		params.put("pageSize", Constants.PAGE_SIZE);
		List<TAdmin> admin = session.selectList(Constants.ADMINMAPPER_SELECTBYLIKE, params);
		session.close();
		if (admin!=null) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(admin);
		}
		return result;
	}
	
	//根据查询 得到查询的数据有多少条
	public Result selectAllCounts(String likeStr) {
		Result result = new Result();
		SqlSession session = MyBatisUtils.openSession();
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("likeStr", "%"+likeStr+"%");
		int counts = session.selectOne(Constants.ADMINMAPPER_SELECT_COUNT, params);
		session.close();
		//这里无需判断 已经在jsp页面进行最大最小值判断
		result.setRetCode(Constants.RETCODE_SUCCESS);
		result.setRetMsg(true);
		result.setRetData(counts);
		return result;
	}

}




















