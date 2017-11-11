package cn.uc.yiqibang.test;

import java.util.List;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

import cn.uc.dao.AdminDao;
import cn.uc.dao.impl.AdminDaoImpl;
import cn.uc.model.Admin;
import cn.uc.util.Result;


public class AdminTest {

	AdminDao adminDao = new AdminDaoImpl();
	
	@Ignore
	@Test
	public void getAllAdmin() {
		Result result = adminDao.selectAllAdmin();
		List<Admin> adminList = (List<Admin>) result.getRetData();
		System.out.println(adminList);
		Assert.assertNotNull(adminList);
	}

	
	@Test
	public void addAdmin(){
		Admin admin = new Admin(2,0,2);
		System.out.println(admin);
		Result result = adminDao.insertAdmin(admin);
		System.out.println(admin);
		boolean result1 = result.isRetMsg();
		Assert.assertEquals(true, result1);
	}
}
