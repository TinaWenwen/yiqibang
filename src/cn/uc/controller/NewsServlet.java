package cn.uc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.uc.dao.TNewsMapper;
import cn.uc.dao.impl.TNewsMapperImpl;
import cn.uc.model.NewsMap;
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
		int id = 0;
		try{
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e){
			
		}
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e){
			return;
		}
		
		
		int typeId = 0;
		try {
			out = response.getWriter();
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
		
		Result result = null;
		if (id <= 0) {
			NewsMap news = new NewsMap();
			news.setAuthor(author);
			news.setContent(content);
			news.setCreatetime(new Date());
			news.setIfhot(ifHot);
			news.setIfreport(ifReport);
			news.setSource(source);
			news.setTitle(title);
			news.setTypeid(typeId);
			result = newsDao.insertSelective(news);
		}else{
			NewsMap news = new NewsMap();
			news.setId(id);
			news.setAuthor(author);
			news.setContent(content);
			news.setIfhot(ifHot);
			news.setIfreport(ifReport);
			news.setSource(source);
			news.setTitle(title);
			news.setTypeid(typeId);
			result = newsDao.updateByPrimaryKeySelective(news);
		}
		
		
		response.setHeader("refresh", "3;url=" +request.getContextPath()+ "/yiQiBangWeb/admin/newsManage.jsp");
		try {
			out = response.getWriter();
			if(result.isRetMsg()){
				out.println("添加成功,3秒后<a href=\""+request.getContextPath()+ "/yiQiBangWeb/admin/newsManage.jsp\">跳转到主页</a>。。。。");
			}else{
				out.println("添加失败！3秒后<a href=\""+request.getContextPath()+ "/yiQiBangWeb/admin/newsManage.jsp\">跳转到主页</a>。。。。");
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

}
