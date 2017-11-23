<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TAdmin,
    javax.servlet.http.HttpSession,
    javax.servlet.http.HttpServletRequest,
    javax.servlet.http.HttpServletResponse"%>

<%	
	
	String imgName = "1511413566068.jpg";//默认头像
	String userName = "";
	int level = 1;
	String levelName = "";
	TAdmin admin = (TAdmin)session.getAttribute("admin");
	if (admin != null) {
		imgName = admin.getUser().getHeadimg();
		userName = admin.getUser().getUsername();
		level = admin.getLevel();
		levelName = level == 1? "超级管理员" : "管理员";
	} 
	
%>
    <header>
            <div class="userImg">
                <img src="/yiQiBang/headImg/<%=imgName %>" style="width:40px;height:40px;">
                <span>欢迎您,<%=levelName%>&nbsp;<%=userName %></span>
            </div>

           <!--  <div class="search">
                <input type="text" placeholder="请输入关键词">
                <img src="../html/backendImg/public/fangdajing.png">
            </div> -->

            <div class="rightDiv">
                <a href="<%=request.getContextPath() %>/AdminServlet?action=adminLogout"><span style="color:white;">注&nbsp;销</span></a>
                <!-- <img src="../html/backendImg/public/suoxiaochuankou.png">
                <img src="../html/backendImg/public/guanbi.png"> -->
            </div>
        </header>