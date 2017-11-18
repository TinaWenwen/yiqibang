package cn.uc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.uc.dao.TAdminMapper;
import cn.uc.dao.TUserMapper;
import cn.uc.dao.impl.TAdminMapperImpl;
import cn.uc.dao.impl.TUserMapperImpl;
import cn.uc.model.TUser;
import cn.uc.util.Result;
import cn.uc.util.WriteResultToCilent;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	TAdminMapper adminDao = new TAdminMapperImpl();
	TUserMapper userDao = new TUserMapperImpl();

	public void userInsert(HttpServletRequest request, HttpServletResponse response){
		String email = request.getParameter("email").trim();;
		String userName = request.getParameter("username").trim();
		String nickName = request.getParameter("nikcname").trim();
		String password = request.getParameter("password").trim();
		String phone = request.getParameter("phone").trim();
		String sex = request.getParameter("sex");
		System.out.println(sex);
		boolean isMan = (sex == "0")? true : false;
		System.out.println(isMan);
		String birthday = request.getParameter("birthday").trim();
		String address = request.getParameter("address").trim();
		String state = request.getParameter("isDisable");
		boolean status = (state == "0") ? true : false;
		String remark = request.getParameter("remark").trim();
		String headImg = request.getParameter("headImg");
		
		TUser user  = new TUser();
		user.setBindtel(phone);
		user.setBirthday(birthday);
		user.setCreatetime(new Date());
		user.setEmail(email);
		user.setHeadimg(headImg);
		user.setNickname(nickName);
		user.setPassword(password);
		user.setRemark(remark);
		user.setSex(isMan);
		user.setState(status);
		user.setUsername(userName);
		Result result = userDao.insertSelective(user);
		
		PrintWriter out;
		response.setHeader("refresh", "3;url=" +request.getContextPath()+ "/yiQiBangWeb/admin/member.jsp");
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
	
	public void userDelete(HttpServletRequest request, HttpServletResponse response){
		int id = Integer.parseInt(request.getParameter("id"));
		Result result = userDao.deleteByPrimaryKey(id);
		WriteResultToCilent.writeMethod(result, response);
	}
}
