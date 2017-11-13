package cn.uc.yiqibang.test;


import org.junit.Assert;
import org.junit.Test;

import cn.uc.dao.CitiesMapper;
import cn.uc.dao.impl.CitiesMapperImpl;
import cn.uc.util.Result;

public class CityTest {

	CitiesMapper cityDao = new CitiesMapperImpl();
	@Test
	public void selectAllCities() {
		Result result = cityDao.selectAllCities();
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}

}
