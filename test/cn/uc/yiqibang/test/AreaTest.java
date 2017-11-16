package cn.uc.yiqibang.test;

import org.junit.Assert;
import org.junit.Test;

import cn.uc.dao.AreasMapper;
import cn.uc.dao.impl.AreasMapperImpl;
import cn.uc.util.Result;

public class AreaTest {

	AreasMapper areaDao = new AreasMapperImpl();
	@Test
	public void selectAreaById() {
		Result result = areaDao.selectAreaByAreaId("110101");
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}

}
