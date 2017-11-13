package cn.uc.yiqibang.test;


import org.junit.Assert;
import org.junit.Test;

import cn.uc.dao.TAdminMapper;
import cn.uc.dao.impl.TAdminMapperImpl;
import cn.uc.util.Result;


public class AdminTest {

	TAdminMapper adminDao = new TAdminMapperImpl();
	@Test
	public void selectAllAdmin() {
		Result result = adminDao.selectAllAdmin();
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}

}
