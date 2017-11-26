<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.*,
    cn.uc.dao.*,
    cn.uc.dao.impl.*,
    java.util.*,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr,
    javax.servlet.http.HttpSession,
    javax.servlet.http.HttpServletRequest,
    javax.servlet.http.HttpServletResponse"%>
    
 <%!
	TUser userData = new TUser();
	TUserMapper userDao = new TUserMapperImpl();
	int id = 0;
%>    
<%
	//这里是用户注册过的 一定是编辑 从session里拿id
	TUser user = (TUser)session.getAttribute("user");
	if (user != null) {
		id = user.getId();
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
<title>个人中心</title>
<link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
<script src="../jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../js/distpicker.data.min.js"></script>
<script src="../js/distpicker.min.js"></script>
<script src="../js/My97DatePicker/WdatePicker.js"></script>
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
.uploadBtn {
	margin-top:10px;
}
.addressSelect{
	padding:5px 5px;
}
</style>
</head>
<body>
<div class="main">
		<form action="<%=request.getContextPath() %>/UserServlet?action=userEditData" method=post>
			<input type="hidden" name="id" value="<%=id%>">
			<div class="form-group">
				<label>邮箱</label> <input
					type="email" name="email" class="form-control" id="InputEmail1" value="<%=id > 0 ? userData.getEmail(): "" %>"
					placeholder="Email">
			</div>
			<div class="form-group">
				<label>用户名</label> <input
					type="text" name="username" class="form-control" id="InputUsername" value="<%=id > 0 ? userData.getUsername(): "" %>"
					placeholder="用户名">
			</div>
			<div class="form-group">
				<label>昵称</label> <input
					type="text" name="nikcname" class="form-control" id="InputNickname" value="<%=id > 0? userData.getNickname(): "" %>"
					placeholder="昵称">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">密码</label> <input
					type="password" name="password" class="form-control" id="InputPassword" value="<%=id > 0 ? userData.getPassword(): "" %>"
					placeholder="Password">
			</div>
			<div class="form-group">
				<label>电话号码</label> <input
					type="number" name="phone" class="form-control" id="InputPhone" value="<%=id > 0 ? userData.getBindtel(): "" %>"
					placeholder="telephone">
			</div>
			<div class="form-group">
				<label>性别:   </label> 
				<label class="radio-inline">
				 <input type="radio" name="sex" id="yes" value="1" <%=id > 0 ? (userData.getSex() ? "checked" : ""): "checked" %>>男
				</label> 
				<label class="radio-inline">
				 <input type="radio" name="sex" id="no" value="0" <%=id > 0 ? (!userData.getSex() ? "checked" : ""): "" %>>女
				</label>
			</div>
			<div class="sample form-group">
				<span>生日：</span>
				<input id="birthday" name="birthday" type="text" class="Wdate" style="height:30px" onclick="WdatePicker()"/>
			</div>
			<div class="form-group" data-toggle="distpicker" id="target">
				<label>地址：</label>
				<select data-province="---- 选择省 ----" name="province" id="province" class="addressSelect"></select>
				<select data-city="---- 选择市 ----" name="city" id="city" class="addressSelect"></select>
				<select data-district="---- 选择区 ----" name=district id="district" class="addressSelect"></select>
			</div>
			<div class="form-group">
				<label>备注</label>
				<input type="text" name="remark" class="form-control" id="iptRemark" value="<%=id > 0 ? userData.getRemark(): "" %>"
					placeholder="备注">
			</div>
			
			<button type="submit" class="btn btn-primary">确认</button>
			<input type="button" class="btn btn-primary" value="取消" onClick="location.href='headSet.jsp'"/>
		</form>
	</div>
</body>
</html>