package cn.uc.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.uc.dao.TAdminMapper;
import cn.uc.dao.TUserMapper;
import cn.uc.dao.impl.TAdminMapperImpl;
import cn.uc.dao.impl.TUserMapperImpl;
import cn.uc.util.Result;
import cn.uc.util.WriteResultToCilent;;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
   
	TAdminMapper adminDao = new TAdminMapperImpl();
	TUserMapper userDao = new TUserMapperImpl();
	
	public void adminLogin(HttpServletRequest request, HttpServletResponse response){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		
		//获取验证码生成的4个正确数组
		HttpSession session = request.getSession();
		String code1 = (String) session.getAttribute("code1");
		
		//从AdminDao中将用户输入的用户名密码跟数据库中的对比 
		
		//验证
		try{
			if(code != null && code.equals(code1)){
//				System.out.println("验证码正确！");
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
			e.printStackTrace();
			System.out.println("跳转失败");
		}
	}
	
	public void adminInsert(HttpServletRequest request, HttpServletResponse response){
		String userName = request.getParameter("username").trim();
		int uid = (int) userDao.selectIdByName(userName).getRetData();
		String state = request.getParameter("isDisable");
		boolean status = (state == "0") ? false : true;
		int level = Integer.parseInt(request.getParameter("level"));
		
		Result result = adminDao.insertSelective(uid, status, level);
		
		PrintWriter out;
		response.setHeader("refresh", "3;url=" +request.getContextPath()+ "/yiQiBangWeb/admin/admin.jsp");
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
	
	public void adminDelete(HttpServletRequest request, HttpServletResponse response){
		int id = Integer.parseInt(request.getParameter("id"));
		Result result = adminDao.deleteByPrimaryKey(id);
		WriteResultToCilent.writeMethod(result, response);
	}
	
	public void adminUpdate(HttpServletRequest request, HttpServletResponse response){
		
	}
	
}











