package cn.uc.dao.impl;

import java.util.List;

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

	@Override
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

}




















