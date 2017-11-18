package cn.uc.yiqibang.test;

import java.util.Date;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

import cn.uc.dao.TTypeMapper;
import cn.uc.dao.impl.TTypeMapperImpl;
import cn.uc.model.TType;
import cn.uc.util.Result;

public class TypeTest {

	TTypeMapper typeDao = new TTypeMapperImpl();
	
	@Ignore
	@Test
	public void selectAllType() {
		Result result = typeDao.selectAllType();
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}
	
	@Test
	public void insert(){
		Result result = typeDao.insertSelective(new TType("啊啊"));
		Assert.assertTrue(result.isRetMsg());
	}
}
