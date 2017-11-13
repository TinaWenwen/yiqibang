package cn.uc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.AreasMapper;
import cn.uc.model.Areas;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class AreasMapperImpl implements AreasMapper {

	@Override
	public Result selectAllAreas() {
		Result result = new Result();
		SqlSession session = MyBatisUtils.openSession();
		List<Areas> areasList = session.selectList(Constants.AREASMAPPER_SELECTALL);
		session.close();
		if(areasList != null){
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(areasList);
		}else{
			result.setRetCode(Constants.RETCODE_FAILED);
			result.setRetMsg(false);
		}
		return result;
	}

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

}
