package cn.uc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.uc.dao.TCommentMapper;
import cn.uc.dao.impl.TCommentMapperImpl;
import cn.uc.model.NewsMap;
import cn.uc.model.TComment;
import cn.uc.model.TUser;
import cn.uc.util.Result;
import cn.uc.util.WriteResultToCilent;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	TCommentMapper commDao = new TCommentMapperImpl();
	public void commentDelete(HttpServletRequest request, HttpServletResponse response){
		int id = Integer.parseInt(request.getParameter("id"));
		Result result = commDao.deleteByPrimaryKey(id);
		WriteResultToCilent.writeMethod(result, response);
	}

	public void commentEdit(HttpServletRequest request, HttpServletResponse response){
		
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

		if (id <= 0) {
			out.print("参数错误");
			return;
		}
		
		/*String title = request.getParameter("title");
		String username = request.getParameter("username");
		String score = request.getParameter("score");*/
		String content = request.getParameter("content");
		int isShow = request.getParameter("isShow").equals("0") ? 0 : 1;
		TComment comm = new TComment();
		comm.setId(id);
		comm.setContent(content);
		comm.setStatus(isShow);
		Result result = commDao.updateByPrimaryKeySelective(comm);
		response.setHeader("refresh", "3;url=" +request.getContextPath()+ "/yiQiBangWeb/admin/commentManage.jsp");
		try {
			out = response.getWriter();
			if(result.isRetMsg()){
				out.println("操作成功,3秒后<a href=\""+request.getContextPath()+ "/yiQiBangWeb/admin/commentManage.jsp\">跳转到主页</a>。。。。");
			}else{
				out.println("操作失败！3秒后<a href=\""+request.getContextPath()+ "/yiQiBangWeb/admin/commentManage.jsp\">跳转到主页</a>。。。。");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 
	
	public void insertComment(HttpServletRequest request, HttpServletResponse response){
		String content = request.getParameter("content");
		int newsid = Integer.parseInt(request.getParameter("newsId"));
		HttpSession session = request.getSession();
		TUser user = (TUser) session.getAttribute("user");
		if (user == null) {
			response.setHeader("refresh", "3;url=" +request.getContextPath()+ "/yiQiBangWeb/front/news.jsp");
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("登录才能评论噢,3秒后<a href=\""+request.getContextPath()+ "/yiQiBangWeb/front/news.jsp?newsid=" + newsid +"\">返回</a>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			int uid = user.getId();
			Result result = commDao.insertComment(newsid, uid, content);
			if (result.isRetMsg()) {
				try {
					response.sendRedirect(request.getContextPath() + "/yiQiBangWeb/front/news.jsp?newsid=" + newsid + "");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}
}
