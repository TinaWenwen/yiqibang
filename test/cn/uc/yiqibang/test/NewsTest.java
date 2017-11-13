package cn.uc.yiqibang.test;

import org.junit.Assert;
import org.junit.Test;


import cn.uc.dao.TNewsMapper;
import cn.uc.dao.impl.TNewsMapperImpl;
import cn.uc.util.Result;

public class NewsTest {

	TNewsMapper newsDao = new TNewsMapperImpl();
	@Test
	public void selectAllNews() {
		Result result = newsDao.selectAllNews();
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}

}
