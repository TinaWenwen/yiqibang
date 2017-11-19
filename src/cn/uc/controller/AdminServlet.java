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
	
	public void adminEdit(HttpServletRequest request, HttpServletResponse response){
		
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
		
		String userName = request.getParameter("username").trim();
		int uid = (int) userDao.selectIdByName(userName).getRetData();
		String state = request.getParameter("isDisable");
		boolean status = state.equals("0") ? false : true;
		int level = Integer.parseInt(request.getParameter("level"));
		
		if (uid <= 0) {
			out.println("用户不存在！");
		}
		
		Result result = new Result();
		if (id <= 0) {
			if (adminDao.selectByUid(uid).getRetData() != null){
				out.println("管理员已存在！");
				
			} else {
				result = adminDao.insertSelective(uid, status, level);
			}
			
		} else {
			result = adminDao.updateByPrimaryKeySelective(id, uid, status, level);
		}		
		
		response.setHeader("refresh", "3;url=" +request.getContextPath()+ "/yiQiBangWeb/admin/admin.jsp");
		if(result.isRetMsg()){
			out.println("操作成功,3秒后<a href=\""+request.getContextPath()+ "/yiQiBangWeb/admin/admin.jsp\">跳转到主页</a>。。。。");
		}else{
			out.println("操作失败！3秒后<a href=\""+request.getContextPath()+ "/yiQiBangWeb/admin/admin.jsp\">跳转到主页</a>。。。。");
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











