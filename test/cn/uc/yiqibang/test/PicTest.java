package cn.uc.yiqibang.test;

import org.junit.Assert;
import org.junit.Test;

import cn.uc.dao.TPicMapper;
import cn.uc.dao.impl.TPicMapperImpl;
import cn.uc.util.Result;

public class PicTest {

	TPicMapper picDao = new TPicMapperImpl();
	@Test
	public void selectAllPic() {
		Result result = picDao.selectAllPic();
		System.out.println(result.getRetData());
		Assert.assertNotNull(result.getRetData());
	}

}
