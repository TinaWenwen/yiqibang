package cn.uc.yiqibang.test;

import java.util.Date;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;


import cn.uc.dao.TNewsMapper;
import cn.uc.dao.impl.TNewsMapperImpl;
import cn.uc.model.NewsMap;
import cn.uc.util.Result;

public class NewsTest {

	TNewsMapper newsDao = new TNewsMapperImpl();
	
	@Ignore
	@Test
	public void insert() {
		NewsMap news = new NewsMap();
		news.setAuthor("111");
		news.setCommcount(11);
		news.setContent("1232132131");
		news.setCreatetime(new Date());
		news.setIfhot(true);
		news.setIfreport(false);
		news.setReadcount(123);
		news.setSharecount(12);
		news.setSource("腾讯新闻");
		news.setTitle("1212");
		
		Result result = newsDao.insertSelective(news);
		System.out.println(result.isRetMsg());
		Assert.assertTrue(result.isRetMsg());
	}

	
	@Test
	public void selectAllCounts(){
		newsDao.updateReadCounts(12);
	}
}
