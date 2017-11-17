package cn.uc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.ProvincesMapper;
import cn.uc.model.Provinces;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class ProvincesMapperImpl implements ProvincesMapper {


	@Override
	public Result selectProvinceById(String provinceid) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		String province = session.selectOne(Constants.PROVINCE_GETBY_PROVINCEID, provinceid);
		session.close();
		if (province != null) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(province);
		}
		return result;
	}

	@Override
	public Result selectAll() {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		List<Provinces> proList = session.selectList(Constants.PROVINCE_SELECTALL);
		session.close();
		if (proList != null) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(proList);
		}
		return result;
	}

}
