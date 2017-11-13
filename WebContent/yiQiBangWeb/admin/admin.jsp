
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TAdmin,
    java.util.*,
    cn.uc.dao.TAdminMapper,
    cn.uc.dao.impl.TAdminMapperImpl,
<<<<<<< HEAD
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr"%>
=======
    cn.uc.util.Result"%>
>>>>>>> 93eebef81e5506515290b32b9e2d0c772064b76e
  
<%!
		List<TAdmin> data;
 	    Result result = new Result();
<<<<<<< HEAD
 		TAdminMapper adminDao = new TAdminMapperImpl(); 
=======
 		TAdminMapper adminDao = new TAdminMapperImpl(); 		
>>>>>>> 93eebef81e5506515290b32b9e2d0c772064b76e
%>  
<%
 		result = adminDao.selectAllAdmin();
		data = (List<TAdmin>)result.getRetData();
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
    <script src="../js/date_util.js"></script>
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
                                <td><%=data.get(i).getState()?"禁用":"可用"%></td>
<<<<<<< HEAD
                                <td><%=data.get(i).getUser().getUsername() %></td>
                                <td><%=DateSimpleStr.getStringDate(data.get(i).getUser().getCreatetime()) %></td>
=======
                                <td><%=data.get(i).getuId() %></td>
                                <td></td>
>>>>>>> 93eebef81e5506515290b32b9e2d0c772064b76e
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





