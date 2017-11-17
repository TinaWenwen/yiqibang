package cn.uc.yiqibang.test;


import java.util.Date;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

import cn.uc.dao.TAdminMapper;
import cn.uc.dao.impl.TAdminMapperImpl;
import cn.uc.model.TAdmin;
import cn.uc.model.TUser;
import cn.uc.util.Result;


public class AdminTest {

	TAdminMapper adminDao = new TAdminMapperImpl();
	
	@Ignore
	@Test
	public void selectAdminById() {
		Result result = adminDao.selectByPrimaryKey(1);
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}

	@Ignore
	@Test
	public void selectAdminByLike(){
		Result result = adminDao.selectAdminByLike("%%",1);
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}
	
	@Ignore
	@Test
	public void selectCounts(){
		Result result = adminDao.selectAllCounts("%t%");
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}
	
	
}
