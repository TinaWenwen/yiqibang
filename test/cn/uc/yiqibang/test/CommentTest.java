package cn.uc.yiqibang.test;



import org.junit.Assert;
import org.junit.Test;


import cn.uc.dao.TCommentMapper;
import cn.uc.dao.impl.TCommentMapperImpl;
import cn.uc.util.Result;

public class CommentTest {

	TCommentMapper commentDao = new TCommentMapperImpl();
	@Test
	public void selectAllComment() {
		Result result = commentDao.selectAllComment();
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}

}
