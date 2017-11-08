<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎登录后台！</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/BackendCss/login.css">
    <script src="../jquery/jquery-3.2.1.min.js"></script>
    <script>
    	function checkValue(){
    		var username=$('#username').val();
    		var password=$('#password').val();
    		var code=$('#basic-code').val();
    		if(username=="" || password=="" || code==""){
    			$('#tip').text("用户名、密码、验证码不能为空");
    			return false;
    		}else{
    			$('#tip').text("");
    			return true;
    		}
    	}
    </script>
</head>
<body>
   <div id="page">
   		<div class="container">
   			<div class="row">
   				<div class="col-md-6 col-md-offset-3">
   					<div class="panel panel-primary my_panel">
   						<img class="logoImg" src="../html/frontImg/logo.png">
   						<div class="panel-body">
   							<form action="/yiQiBang/AdminServlet" method="post" onsubmit="return checkValue()"
   							class="form-horizontal col-md-10 col-md-offset-1 my_login_f">
   								<div class="form-group">
   									<label for="username" class="col-sm-3 control-label">用户名:</label>
   									<div class="col-sm-9">
   										<input type="text" class="form-control" id="username"
   										name="username" placeholder="请输入用户名">
   										<input type="hidden" name="action" value="adminLogin">
   									</div>
   								</div>
   								
   								<div class="form-group">
   									<label for="password" class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;码:</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="password"
											name="password"  placeholder="请输入密码" >
									</div>
   								</div>
   								
   								<div class="form-group">
									<label for="validateCode" class="col-sm-3 control-label">验证码:</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon3">
											 <img id="validate_img" alt="点击重试" src="validate.jsp" onclick="refreshCode()" style="cursor:hand;"></span> 
												<input
												type="text" class="form-control" id="basic-code"
												name="code" aria-describedby="basic-addon3"  placeholder="验证码">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label class="checkbox-inline col-sm-offset-4"> <input
										type="checkbox" id="inlineCheckbox1" value="option1">
										记住密码
									</label> <label class="checkbox-inline"> <input type="checkbox"
										id="inlineCheckbox2" value="option2"> 自动登录
									</label>
								</div>
								<div class="form-group">
									<p id="tip" class="col-sm-offset-4">${sessionScope.tip}<%session.setAttribute("tip", ""); %></p>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-3">
										<button type="submit" class="btn btn-primary">登录</button>
									</div>
									<div class="col-sm-offset-1 col-sm-3">
										<button type="button" class="btn btn-primary">注册</button>
									</div>
								</div>
   							</form>
   						</div>
   					</div>
   				</div>
   			</div>
   		</div>
   </div>
</body>
<script type="text/javascript">
	function refreshCode(){
		$("#validate_img").attr("src","validate.jsp?abc=" + Math.random());
	}
</script>
</html>