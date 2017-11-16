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
		<form>
			<div class="form-group">
				<label>选择用户</label> 
				<select class="form-control" id="username">
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
				<label>等级</label> 
				<select class="form-control" id="username">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">确认</button>
			<button type="button" class="btn btn-primary">取消</button>
		</form>
	</div>
</body>
</html>