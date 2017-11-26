package cn.uc.yiqibang.test;




import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

import cn.uc.dao.TUserMapper;
import cn.uc.dao.impl.TUserMapperImpl;

import cn.uc.util.Result;

public class UserTest {

	TUserMapper userDao = new TUserMapperImpl();
	
	@Ignore
	@Test
	public void selectAllUser() {
		Result result = userDao.selectByPrimaryKey(1);
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}

	@Test
	public void registerUser(){
		Result result = userDao.userRegister("test", "123");
		Assert.assertTrue(result.isRetMsg());
	}
}
