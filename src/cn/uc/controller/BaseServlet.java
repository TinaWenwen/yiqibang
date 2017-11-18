package cn.uc.controller;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action==null || "".equals(action)){//判断用户请求是否添加action参数
			response.getWriter().println("请求参数非法，必须携带action表明操作意图");
		}else{
			//使用反射机制，获取action的方法然后调用
			try {
				Method method = this.getClass().getMethod(action, HttpServletRequest.class,HttpServletResponse.class);
				method.invoke(this,request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.getWriter().println("请求参数值错误，没有该操作");
			} 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*System.out.println(request.getParameterMap().values());*/
		doGet(request, response);
		
	}

}
