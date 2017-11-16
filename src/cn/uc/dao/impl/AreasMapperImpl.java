package cn.uc.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.AreasMapper;
import cn.uc.model.Areas;
import cn.uc.model.TAdmin;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class AreasMapperImpl implements AreasMapper {

	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Areas record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Areas record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Areas selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Areas record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Areas record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Result selectAreaByAreaId(String areaid) {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		String area = session.selectOne(Constants.AREA_GETBY_AREAID, areaid);
		session.close();
		if (area != null) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(area);
		}
		return result;
	}

}
