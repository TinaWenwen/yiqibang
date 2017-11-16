package cn.uc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.CitiesMapper;
import cn.uc.model.Cities;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class CitiesMapperImpl implements CitiesMapper {

	

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Cities record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Cities record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Cities selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Cities record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Cities record) {
		// TODO Auto-generated method stub
		return 0;
	}

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

}
