package cn.uc.yiqibang.test;



import org.junit.Assert;
import org.junit.Test;


import cn.uc.dao.ProvincesMapper;
import cn.uc.dao.impl.ProvincesMapperImpl;
import cn.uc.util.Result;

public class ProvinceTest {

	ProvincesMapper provinceDao = new ProvincesMapperImpl();
	
	@Test
	public void selectProvinceById() {
		Result result = provinceDao.selectProvinceById("110000");
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}

}
