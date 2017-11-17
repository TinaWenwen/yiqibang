package cn.uc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.CitiesMapper;
import cn.uc.model.Cities;
import cn.uc.model.Provinces;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class CitiesMapperImpl implements CitiesMapper {

	
	@Override
	public Result selectCityById(String cityId) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		String city = session.selectOne(Constants.CITY_GETBY_CITYID, cityId);
		session.close();
		if (city != null) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(city);
		}
		return result;
	}

	@Override
	public Result selectAll() {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		List<Cities> cityList = session.selectList(Constants.CITY_SELECTALL);
		session.close();
		if (cityList != null) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(cityList);
		}
		return result;
	}

}
