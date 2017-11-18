<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.*,
    cn.uc.dao.*,
    cn.uc.dao.impl.*,
    java.util.*,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr"%>
<%!
	TUser userData = new TUser();
	TUserMapper userDao = new TUserMapperImpl();
	int id = 0;
%>    
<%
	//判断id是否存在，区分编辑还是新增
	try {
		id = Integer.parseInt(request.getParameter("id"));
	}  catch (NumberFormatException e) {
		id = 0;	
	}
	//编辑
	if (id > 0) {
		userData = (TUser)userDao.selectByPrimaryKey(id).getRetData();
		//System.out.print(userData);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
<script src="../jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap/bootstrap/dist/js/bootstrap.min.js"></script>
<style>
body {
	background: #F1F0EE;
}

.main {
	width: 40%;
	margin: 40px 0 0 40px;
	border: 1px solid gray;
	padding: 10px;
}
</style>
</head>
<body>

	<div class="main">
		<form action="<%=request.getContextPath() %>/UserServlet?action=userEdit" method=post>
			<input type="hidden" name="id" value="<%=id%>">
			<div class="form-group">
				<label>邮箱</label> <input
					type="email" name="email" class="form-control" id="InputEmail1" value="<%=userData.getEmail() %>"
					placeholder="Email">
			</div>
			<div class="form-group">
				<label>用户名</label> <input
					type="text" name="username" class="form-control" id="InputUsername" value="<%=userData.getUsername() %>"
					placeholder="用户名">
			</div>
			<div class="form-group">
				<label>昵称</label> <input
					type="text" name="nikcname" class="form-control" id="InputNickname" value="<%=userData.getNickname() %>"
					placeholder="昵称">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">密码</label> <input
					type="password" name="password" class="form-control" id="InputPassword" value="<%=userData.getPassword() %>"
					placeholder="Password">
			</div>
			<div class="form-group">
				<label>电话号码</label> <input
					type="number" name="phone" class="form-control" id="InputPhone" value="<%=userData.getBindtel() %>"
					placeholder="telephone">
			</div>
			<div class="form-group">
				<label>性别:   </label> 
				<label class="radio-inline">
				 <input type="radio" name="sex" id="yes" value="1" <%=userData.getSex() ? "checked" : null %>>男
				</label> 
				<label class="radio-inline">
				 <input type="radio" name="sex" id="no" value="0" <%=!userData.getSex() ? "checked" : null %>>女
				</label>
			</div>
			<div class="form-group">
				<label>生日</label>
				<input type="text" name="birthday" class="form-control" id="iptBirthday" value="<%=userData.getBirthday() %>"
					placeholder="2017-11-01">
			</div>
			<div class="form-group">
				<label>地址</label>
				<input type="text" name="address" class="form-control" value="<%=userData.getAreaid() %>"
					placeholder="地址">
			</div>
			<div class="form-group">
				<label>状态:   </label> 
				<label class="radio-inline">
				 <input type="radio" name="isDisable" id="yesState" value="1" <%=userData.getSex() ? "checked" : null %>>禁用
				</label> 
				<label class="radio-inline">
				 <input type="radio" name="isDisable" id="noState" value="0" <%=!userData.getSex() ? "checked" : null %>>可用
				</label>
			</div>
			<div class="form-group">
				<label>备注</label>
				<input type="text" name="remark" class="form-control" id="iptRemark" value="<%=userData.getRemark() %>"
					placeholder="备注">
			</div>
			<div class="form-group">
				<label>上传头像</label> <input type="file" name="headImg" value="<%=userData.getHeadimg() %>"
					id="exampleInputFile">
			</div>
			
			<button type="submit" class="btn btn-primary">确认</button>
			<input type="button" class="btn btn-primary" value="取消" onClick="location.href='member.jsp'"/>
		</form>
	</div>

</body>
</html>