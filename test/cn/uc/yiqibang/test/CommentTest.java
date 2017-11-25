package cn.uc.yiqibang.test;



import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;


import cn.uc.dao.TCommentMapper;
import cn.uc.dao.impl.TCommentMapperImpl;
import cn.uc.util.Result;

public class CommentTest {

	TCommentMapper commentDao = new TCommentMapperImpl();
	
	@Ignore
	@Test
	public void selectCommByLike() {
		Result result = commentDao.selectByNewsid(12);
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}
	
	@Test
	public void insert() {
		Result result = commentDao.insertComment(22, 9, "这些娃娃真可爱");
		Assert.assertTrue(result.isRetMsg());
	}
	

}
