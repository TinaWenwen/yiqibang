package cn.uc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.uc.dao.TNewsMapper;
import cn.uc.dao.impl.TNewsMapperImpl;
import cn.uc.model.NewsMap;
import cn.uc.util.ImgUtil;
import cn.uc.util.Result;
import cn.uc.util.WriteResultToCilent;

/**
 * Servlet implementation class NewsServlet
 */
@WebServlet("/NewsServlet")
public class NewsServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	TNewsMapper newsDao = new TNewsMapperImpl();
	
	public void newsEdit(HttpServletRequest request, HttpServletResponse response){
	
		PrintWriter out = null;
		int id = 0;
		int typeId = 0;
		try {
			out = response.getWriter();
			id = Integer.parseInt(request.getParameter("id"));
			typeId = Integer.parseInt(request.getParameter("newType"));
		} catch (IOException e){
			return;
		} catch (NumberFormatException e){
			out.println("参数错误");
		}
		
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String source = request.getParameter("source");
		String content = request.getParameter("content");
		String isHot = request.getParameter("isHot");
		boolean ifHot = isHot.equals("0") ? false : true;
		String isReport = request.getParameter("isReport");
		boolean ifReport = isReport.equals("0") ? false : true;
		//从content里面获取图片列表
		List<String> list = ImgUtil.getImageSrc(content);  
		String picturePath = null;
		
		if (list.size() != 0) {
			picturePath = ImgUtil.listToString(list, ',');
		}
		String editorValue=request.getParameter("editorValue");
		
		Result result = null;
		if (id <= 0) {
			NewsMap news = new NewsMap();
			news.setAuthor(author);
			news.setContent(editorValue);
			news.setContent(content);
			news.setCreatetime(new Date());
			news.setIfhot(ifHot);
			news.setIfreport(ifReport);
			news.setSource(source);
			news.setTitle(title);
			news.setPic(picturePath);
			news.setTypeId(typeId);
			result = newsDao.insertSelective(news);
		}else{
			NewsMap news = new NewsMap();
			news.setId(id);
			news.setAuthor(author);
			news.setContent(editorValue);
			news.setContent(content);
			news.setIfhot(ifHot);
			news.setIfreport(ifReport);
			news.setSource(source);
			news.setTitle(title);
			news.setPic(picturePath);
			news.setTypeId(typeId);
			result = newsDao.updateByPrimaryKeySelective(news);
		}
		
		
		response.setHeader("refresh", "3;url=" +request.getContextPath()+ "/yiQiBangWeb/admin/newsManage.jsp");
		try {
			out = response.getWriter();
			if(result.isRetMsg()){
				out.println("操作成功,3秒后<a href=\""+request.getContextPath()+ "/yiQiBangWeb/admin/newsManage.jsp\">跳转到主页</a>。。。。");
			}else{
				out.println("操作失败！3秒后<a href=\""+request.getContextPath()+ "/yiQiBangWeb/admin/newsManage.jsp\">跳转到主页</a>。。。。");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void newsDelete(HttpServletRequest request, HttpServletResponse response){
		int id = Integer.parseInt(request.getParameter("id"));
		Result result = newsDao.deleteByPrimaryKey(id);
		WriteResultToCilent.writeMethod(result, response);
	}
	
	public void getNewsByTypeId(HttpServletRequest request,HttpServletResponse response){
		int typeid = Integer.parseInt(request.getParameter("typeid"));
		Result result = newsDao.selectNewsByTypeId(typeid);
		WriteResultToCilent.writeMethod(result, response);
	}

}
