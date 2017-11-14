
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TAdmin,
    java.util.*,
    cn.uc.dao.TAdminMapper,
    cn.uc.dao.impl.TAdminMapperImpl,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr"%>
  
<%!
		List<TAdmin> data;
 	    Result result = new Result();
 		TAdminMapper adminDao = new TAdminMapperImpl(); 
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
    
    <script>
		function searchAdminByLike() {
			var searchStr = $('#searchStr').val();
			$.ajax({
				url : "/yiQiBang/AdminServlet",
				data : {
					action : "adminGetByLike",
					likeStr : searchStr
				},
				type : "get",
				timeout : 5000,
				beforesend : function(){
					
				},
				success : function(data){
					var datas = JSON.parse(data);
					
				},
				error : function(e){
					alert("请求失败");
				},
				complete : function(){
					
				}
			});
		}
	</script>
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
                    	<input type="text" placeholder="用户名/级别" name="searchStr">
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
                                <td><%=data.get(i).getUser().getUsername() %></td>
                                <td><%=DateSimpleStr.getStringDate(data.get(i).getUser().getCreatetime()) %></td>
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





