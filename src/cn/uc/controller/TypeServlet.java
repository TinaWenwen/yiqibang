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
	
	public void typeInsert(HttpServletRequest request, HttpServletResponse response){
		String typeName = request.getParameter("type").trim();
		
		TType type = new TType(typeName,new Date());
		Result result = typeDao.insertSelective(type);
		
		PrintWriter out;
		response.setHeader("refresh", "3;url=" +request.getContextPath()+ "/yiQiBangWeb/admin/newsClassifyManage.jsp");
		try {
			out = response.getWriter();
			if(result.isRetMsg()){
				out.println("添加成功,3秒后跳转到主页。。。。");
			}else{
				out.println("添加失败！3秒后跳转到主页。。。。");
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
