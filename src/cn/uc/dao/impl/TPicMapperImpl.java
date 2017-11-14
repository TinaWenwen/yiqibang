package cn.uc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.uc.dao.TPicMapper;
import cn.uc.model.TPic;
import cn.uc.util.Constants;
import cn.uc.util.MyBatisUtils;
import cn.uc.util.Result;

public class TPicMapperImpl implements TPicMapper {

	@Override
	public Result selectAllPic() {
		Result result = new Result();
		SqlSession session = MyBatisUtils.openSession();
		List<TPic> picList = session.selectList(Constants.PICMAPPER_SELECTALL);
		session.close();
		if(picList != null){
			result.setRetCode(Constants.RETCODE_SUCCESS);
			result.setRetMsg(true);
			result.setRetData(picList);
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
	public int insert(TPic record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(TPic record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TPic selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(TPic record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(TPic record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
