
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.Admin,java.util.*"%>
  
<%!
		List<Admin> data;
%>  
<%
 		data = (List<Admin>)application.getAttribute("admin_list");
		if(data == null){
			data = new ArrayList<Admin>();
			data.add(new Admin());
			application.setAttribute("admin_list", data);
		} 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员管理</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/BackendCss/backend.css">
    <script src="../jquery/jquery-3.2.1.min.js"></script>
    <script src="../bootstrap/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="my_container">
        <%@ include file="header.jsp" %>

        <div class="context">
            <%@ include file="menu.jsp" %>

            <div class="main">
                <div class="tableTop">
                    <ul class="nav nav-tabs">
                        <li><a href="<%=request.getContextPath()%>/yiQiBangWeb/admin/member.jsp">会员</a></li>
                        <li class="active"><a href="#">管理员</a></li>
                    </ul>
                    <div class="searchUser">
                        <input type="text" placeholder="昵称/用户名/手机/备注">
                        <img src="../html/backendImg/public/fangdajing.png">
                    </div>
                    <div class="addDiv">
                        <span class="glyphicon glyphicon-plus"></span>
                        添加
                    </div>
                </div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active">
                        <table class="table table-bordered">
                            <thead>
                            <th>序号</th>
                            <th>级别</th>
                            <th>状态</th>
                            <th>用户名</th>
                            <th>添加时间</th>
                            <th>操作</th>
                            </thead>
                            <tbody>
                             <% for(int i = 0; i < data.size(); i++) {%>
                            <tr>
                                <td><%=i+1%></td>
                                <td><%=data.get(i).getLevel()%></td>
                                <td><%=data.get(i).getStatus()%></td>
                                <td></td>
                                <td></td>
                                <td><a href="<%=request.getContextPath()%>/admin/deleteMember?id=<%=i%>"><img src="../html/backendImg/public/xiugai.png"></a>
                                <a href="<%=request.getContextPath()%>/admin/deleteMember?id=<%=i%>"><img src="../html/backendImg/public/shanchu.png"></a></td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
$(function(){
	$('.leftContext li:eq(0)').addClass('active');
});
</script>
</body>
</html>





