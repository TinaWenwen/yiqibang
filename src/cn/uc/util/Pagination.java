package cn.uc.util;

import java.util.List;

//分页工具类
public class Pagination {
	
	public static final int COUNT = 20;
	//定义每页显示的最多条数
	//开始查询的数据索引
	private int pageCount;
	private int startIndex;
	private List<Object> objs;
	
	
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}


	public List<Object> getObjs() {
		return objs;
	}

	public void setObjs(List<Object> objs) {
		this.objs = objs;
	}
	
	
}
