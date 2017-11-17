<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		<form action="<%=request.getContextPath() %>/AdminServlet?action=adminInsert" method=post>
			<div class="form-group">
				<label>选择用户</label> <input type="text" class="form-control"
					name="username" placeholder="用户名">
				<p class="help-block">请输入设置为管理员的用户信息</p>
			</div>
			<div class="form-group">
				<label>状态:   </label> 
				<label class="radio-inline">
				 <input type="radio" name="isDisable" id="yesState" value="1" checked>禁用
				</label> 
				<label class="radio-inline">
				 <input type="radio" name="isDisable" id="noState" value="0">可用
				</label>
			</div>
			<div class="form-group">
				<label>等级</label> 
				<select class="form-control" id="level" name="level">
					<option>1</option>
					<option>2</option>
					<option>3</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">确认</button>
			<input type="button" class="btn btn-primary" value="取消" onClick="location.href='admin.jsp'"/>
		</form>
	</div>
</body>
</html>