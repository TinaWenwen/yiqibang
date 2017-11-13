<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TUser,
    java.util.*,
    cn.uc.dao.TUserMapper,
    cn.uc.dao.impl.TUserMapperImpl,
    cn.uc.util.Result"%>
    
 <%!
 	List<TUser> data;
 	Result result = new Result();
 	TUserMapper userDao = new TUserMapperImpl();
 %> 
 <%
 	result = userDao.selectAllUser();
 	data = (List<TUser>)result.getRetData();
 %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>会员管理</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/BackendCss/backend.css">
    <script src="../jquery/jquery-3.2.1.min.js"></script>
    <script src="../bootstrap/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="my_container">
        <%@ include file="header.jsp" %>

        <div class="context">
            <%@ include file="menu.jsp"  %>

            <div class="main">
                <div class="tableTop">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="active"><a href="#">会员</a></li>
                        <li><a href="<%=request.getContextPath()%>/yiQiBangWeb/admin/admin.jsp">管理员</a></li>
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
                    <div role="tabpanel" class="tab-pane active" id="client">
                        <table class="table table-bordered">
                            <thead>
                            <th>序号</th>
                            <th>用户名</th>
                            <th>昵称</th>
                            <th>性别</th>
                            <th>生日</th>
                            <th>地址</th>
                            <th>手机号</th>
                            <th>邮箱</th>
                            <th>状态</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                            <th>头像</th>
                            <th>备注</th>
                            <th>操作</th>
                            </thead>
                            <tbody>
                            <% for(int i = 0; i < data.size(); i++) {%>
                            <tr>
                                <td><%=i+1 %></td>
                                <td><%=data.get(i).getUsername() %></td>
                                <td><%=data.get(i).getNickname() %></td>
                                <td><%=data.get(i).getSex() %></td>
                                <td><%=data.get(i).getBirthday() %></td>
                                <td><%=data.get(i).getProvinceid() %>/<%=data.get(i).getCityid() %>/<%=data.get(i).getAreaid() %></td>
                                <td><%=data.get(i).getBindtel() %></td>
                                <td><%=data.get(i).getEmail() %></td>
                                <td><%=data.get(i).getState() %></td>
                                <td><%=data.get(i).getCreatetime() %></td>
                                <td><%=data.get(i).getUpdate() %></td>
                                <td><%=data.get(i).getHeadimg() %></td>
                                <td><%=data.get(i).getRemark() %></td>
                                <td>
                                <a href=""><img src="../html/backendImg/public/xiugai.png"></a>
                                <a href=""><img src="../html/backendImg/public/shanchu.png"></a>
                                </td>
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





