package cn.uc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import cn.uc.dao.AdminDao;
import cn.uc.model.Admin;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class AdminDaoImpl implements AdminDao {

	@Override
	public Result selectAllAdmin() {
		Result result = new Result();
		SqlSession session = MyBatisUtils.openSession();
		List<Admin> adminList = session.selectList(Constants.ADMINMAPPER_SELECTALL);
		session.close();
		if(adminList != null){
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetData(adminList);
			result.setRetMsg(true);
		}else{
			result.setRetMsg(false);
			result.setRetCode(Constants.RETCODE_FAILED);
		}
		return result;
	}
}
