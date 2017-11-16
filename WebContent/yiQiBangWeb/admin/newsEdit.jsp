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
	width: 40%;
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
				<label>类型</label> <select class="form-control" id="newType">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<div class="form-group">
				<label>标题</label> <input type="text"
					class="form-control" id="titile" placeholder="请输入标题">
			</div>
			<div class="form-group">
				<label>作者</label> <input type="text"
					class="form-control" id="author" placeholder="请输入作者">
			</div>
			<div class="form-group">
				<label>来源</label> <input type="text"
					class="form-control" id="source" placeholder="请输入新闻来源">
			</div>
			<div class="form-group">
				<label>新闻内容</label> 
				<textarea rows="10" cols="30" class="form-control"></textarea>
			</div>
		
			<div class="form-group">
				<label>是否热门: </label> <label class="radio-inline"> <input
					type="radio" name="ifHot" id="yes" value="true" checked>是
				</label> <label class="radio-inline"> <input type="radio"
					name="ifHot" id="no" value="false">否
				</label>
			</div>

			<div class="form-group">
				<label>是否举报: </label> <label class="radio-inline"> <input
					type="radio" name="ifReport" id="yes" value="true" checked>是
				</label> <label class="radio-inline"> <input type="radio"
					name="ifReport" id="no" value="false">否
				</label>
			</div>

			<button type="submit" class="btn btn-primary">确认</button>
			<button type="button" class="btn btn-primary">取消</button>
		</form>
	</div>
</body>
</html>