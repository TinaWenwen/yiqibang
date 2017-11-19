package cn.uc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.uc.dao.TTypeMapper;
import cn.uc.dao.impl.TTypeMapperImpl;
import cn.uc.model.TType;
import cn.uc.util.Result;
import cn.uc.util.WriteResultToCilent;

/**
 * Servlet implementation class TypeServlet
 */
@WebServlet("/TypeServlet")
public class TypeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	TTypeMapper typeDao = new TTypeMapperImpl();
	
	public void typeEdit(HttpServletRequest request, HttpServletResponse response){
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
		
		String typeName = request.getParameter("type").trim();
		TType type = new TType();
		
		Result result = new Result();
		if ( id <= 0) {
			type.setName(typeName);
			type.setCreatetime(new Date());
			result = typeDao.insertSelective(type);
		} else {
			type.setId(id);
			type.setName(typeName);
			result = typeDao.updateByPrimaryKeySelective(type);
		}
		
		response.setHeader("refresh", "3;url=" +request.getContextPath()+ "/yiQiBangWeb/admin/newsClassifyManage.jsp");
		try {
			out = response.getWriter();
			if(result.isRetMsg()){
				out.println("操作成功,3秒后<a href=\""+request.getContextPath()+ "/yiQiBangWeb/admin/newsClassifyManage.jsp\">跳转到主页</a>。。。。");
			}else{
				out.println("操作失败！3秒后<a href=\""+request.getContextPath()+ "/yiQiBangWeb/admin/newsClassifyManage.jsp\">跳转到主页</a>。。。。");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void typeDelete(HttpServletRequest request, HttpServletResponse response){
		int id = Integer.parseInt(request.getParameter("id"));
		Result result = typeDao.deleteByPrimaryKey(id);
		WriteResultToCilent.writeMethod(result, response);
	}
	
}
