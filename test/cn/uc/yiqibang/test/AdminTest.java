package cn.uc.yiqibang.test;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;

import cn.uc.dao.AdminDao;
import cn.uc.dao.impl.AdminDaoImpl;
import cn.uc.model.Admin;
import cn.uc.util.Result;

public class AdminTest {

	AdminDao adminDao = new AdminDaoImpl();
	
	@Test
	public void getAllAdmin() {
		Result result = adminDao.selectAllAdmin();
		List<Admin> adminList = (List<Admin>) result.getRetData();
		System.out.println(adminList);
		Assert.assertNotNull(adminList);
	}

}
