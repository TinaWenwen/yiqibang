package cn.uc.yiqibang.test;

import org.junit.Assert;
import org.junit.Test;

import cn.uc.dao.TTypeMapper;
import cn.uc.dao.impl.TTypeMapperImpl;
import cn.uc.util.Result;

public class TypeTest {

	TTypeMapper typeDao = new TTypeMapperImpl();
	@Test
	public void selectAllType() {
		Result result = typeDao.selectAllType();
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}

}
