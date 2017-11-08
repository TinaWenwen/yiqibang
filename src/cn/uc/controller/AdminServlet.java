package cn.uc.controller;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
   
	public void adminLogin(HttpServletRequest request,HttpServletResponse response){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		
		//获取验证码生成的4个正确数组
		HttpSession session = request.getSession();
		String code1 = (String) session.getAttribute("code1");
		
		//验证
		try{
			if(code != null && code.equals(code1)){
				System.out.println("验证码正确！");
				if("tina".equals(username) && "1234".equals(password)){
					response.sendRedirect(request.getContextPath()+"/yiQiBangWeb/admin/admin.jsp");
				}else{
					session.setAttribute("tip", "用户名或者密码错误");
					response.sendRedirect(request.getContextPath()+"/yiQiBangWeb/admin/login.jsp");
				}
			}else{
				session.setAttribute("tip", "验证码错误");
				response.sendRedirect(request.getContextPath()+"/yiQiBangWeb/admin/login.jsp");
			}
		}catch(Exception e){
			System.out.println("跳转失败");
		}
		
	}

}











