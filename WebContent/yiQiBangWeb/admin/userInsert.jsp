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
	body{
		background:#F1F0EE;
	}
	.main{
		width:40%;
		margin:40px 0 0 40px;
		border:1px solid gray;
		padding:10px;
	}
</style>
</head>
<body>

	<div class="main">
		<form>
			<div class="form-group">
				<label for="exampleInputEmail1">邮箱</label> <input
					type="email" class="form-control" id="InputEmail1"
					placeholder="Email">
			</div>
			<div class="form-group">
				<label for="exampleInputUsername">用户名</label> <input
					type="text" class="form-control" id="InputUsername"
					placeholder="用户名">
			</div>
			<div class="form-group">
				<label>昵称</label> <input
					type="text" class="form-control" id="InputNickname"
					placeholder="昵称">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">密码</label> <input
					type="password" class="form-control" id="InputPassword"
					placeholder="Password">
			</div>
			<div class="form-group">
				<label>电话号码</label> <input
					type="number" class="form-control" id="InputPhone"
					placeholder="telephone">
			</div>
			<div class="form-group">
				<label>性别:   </label> 
				<label class="radio-inline">
				 <input type="radio" name="ifHot" id="yes" value="true" checked>男
				</label> 
				<label class="radio-inline">
				 <input type="radio" name="ifHot" id="no" value="false">女
				</label>
			</div>
			<div class="form-group">
				<label>生日</label>
				<input type="text" class="form-control" id="iptBirthday"
					placeholder="2017/11/01">
			</div>
			<div class="form-group">
				<label>地址</label> 
				<select class="form-control" id="province">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
				<select class="form-control" id="city">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
				<select class="form-control" id="area">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<div class="form-group">
				<label>状态:   </label> 
				<label class="radio-inline">
				 <input type="radio" name="ifDisable" id="yesState" value="true" checked>禁用
				</label> 
				<label class="radio-inline">
				 <input type="radio" name="ifDisable" id="noState" value="false">可用
				</label>
			</div>
			<div class="form-group">
				<label>备注</label>
				<input type="text" class="form-control" id="iptRemark"
					placeholder="备注">
			</div>
			<div class="form-group">
				<label for="exampleInputFile">上传头像</label> <input type="file"
					id="exampleInputFile">
			</div>
			
			<button type="submit" class="btn btn-primary">确认</button>
			<button type="button" class="btn btn-primary">取消</button>
		</form>
	</div>

</body>
</html>