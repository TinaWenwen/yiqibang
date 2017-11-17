package cn.uc.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.AreasMapper;
import cn.uc.model.Areas;
import cn.uc.model.Provinces;
import cn.uc.model.TAdmin;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class AreasMapperImpl implements AreasMapper {


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

	@Override
	public Result selectAll() {
		Result result = new Result();
		result.setRetCode(Constants.RETCODE_FAILED);
		SqlSession session = MyBatisUtils.openSession();
		List<Areas> areaList = session.selectList(Constants.AREA_SELECTALL);
		session.close();
		if (areaList != null) {
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(areaList);
		}
		return result;
	}

}
