package cn.uc.yiqibang.test;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;


import cn.uc.dao.TNewsMapper;
import cn.uc.dao.impl.TNewsMapperImpl;
import cn.uc.util.Result;

public class NewsTest {

	TNewsMapper newsDao = new TNewsMapperImpl();
	
	
	@Test
	public void selectNewsByLike() {
		Result result = newsDao.selectNewsByLike("", 1);
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}

	@Ignore
	@Test
	public void selectAllCounts(){
		Result result = newsDao.selectAllCounts("");
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}
}
