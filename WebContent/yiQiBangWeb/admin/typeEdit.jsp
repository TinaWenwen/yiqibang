<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<label>新闻类型</label> 
				<input type="text" class="form-control" id="InputType"
					placeholder="新闻类型">
			</div>
			<button type="submit" class="btn btn-primary">确认</button>
			<button type="button" class="btn btn-primary">取消</button>
		</form>
	</div>
</body>
</html>