package cn.uc.yiqibang.test;


import org.junit.Assert;
import org.junit.Test;

import cn.uc.dao.TUserMapper;
import cn.uc.dao.impl.TUserMapperImpl;
import cn.uc.util.Result;

public class UserTest {

	TUserMapper userDao = new TUserMapperImpl();

	@Test
	public void selectAllUser() {
		Result result = userDao.selectAllUser();
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}

}
