<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="cn.uc.model.TAdmin,
    cn.uc.dao.TAdminMapper,
    cn.uc.dao.impl.TAdminMapperImpl,
    cn.uc.util.Result"%>
<%!
	TAdmin adminData = new TAdmin();
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
		TAdminMapper adminDao = new TAdminMapperImpl();
		adminData = (TAdmin)adminDao.selectByPrimaryKey(id).getRetData();
		System.out.print(adminData.getUser());
	}
%>    
<!DOCTYPE html">
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
	width: 20%;
	margin: 40px 0 0 40px;
	border: 1px solid gray;
	padding: 10px;
}
</style>
</head>
<body>
	<div class="main">
		<form action="<%=request.getContextPath() %>/AdminServlet?action=adminEdit" method=post>
			<input type="hidden" name="id" value="<%=id%>">
			<div class="form-group">
				<label>选择用户</label> <input type="text" class="form-control"
					name="username" value="<%=id > 0 ? adminData.getUser().getUsername() : "" %>" placeholder="用户名">
				<p class="help-block">请输入设置为管理员的用户信息</p>
			</div>
			<div class="form-group">
				<label>状态:   </label> 
				<label class="radio-inline">
				 <input type="radio" name="isDisable" id="yesState" value="1" <%=id > 0? (adminData.getState() ? "checked": ""): "checked"  %>>禁用
				</label> 
				<label class="radio-inline">
				 <input type="radio" name="isDisable" id="noState" value="0" <%=id > 0? (!adminData.getState() ? "checked": ""): ""  %>>可用
				</label>
			</div>
			<div class="form-group">
				<label>等级</label> 
				<select class="form-control" id="level" name="level">
					<option <%=id > 0 ? (adminData.getLevel() == 1 ? "selected" : ""): "1" %>>1</option>
					<option <%=id > 0 ? (adminData.getLevel() == 2 ? "selected" : ""): "" %>>2</option>
					<%-- <option <%=id > 0 ? (adminData.getLevel() == 3 ? "selected" : ""): "" %>>3</option> --%>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">确认</button>
			<input type="button" class="btn btn-primary" value="取消" onClick="location.href='admin.jsp'"/>
		</form>
	</div>
</body>
</html>