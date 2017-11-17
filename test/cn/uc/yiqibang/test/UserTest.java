package cn.uc.yiqibang.test;


import java.util.Date;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

import cn.uc.dao.TUserMapper;
import cn.uc.dao.impl.TUserMapperImpl;
import cn.uc.model.TUser;
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
	public void insertUser(){
		TUser user = new TUser("张三6","小三6","123",true,"123456","123@qq.com","",true,new Date(),new Date(),"啦啦啦",null);
		Result result = userDao.insertSelective(user);
		System.out.println(result.isRetMsg());
		Assert.assertTrue(result.isRetMsg());
	}
}
