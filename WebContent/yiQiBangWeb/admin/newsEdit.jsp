<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TType,
    cn.uc.dao.TTypeMapper,
    cn.uc.dao.impl.TTypeMapperImpl,
    java.util.*,
    cn.uc.util.Result,
    cn.uc.util.Constants"%>
 
<%!
List<TType> typeData;
Result result = new Result();
TTypeMapper typeDao = new TTypeMapperImpl();
%>

<%
result = typeDao.selectAllType();
typeData = (List<TType>) result.getRetData();
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
		<form action="<%=request.getContextPath() %>/NewsServlet?action=newsInsert" method=post>
			<div class="form-group">
				<label>类型</label> <select class="form-control" id="newType" name="newType">
				<% for(int i = 0; i < typeData.size(); i++) {%>
					<option value="<%=typeData.get(i).getId() %>"><%=typeData.get(i).getName() %></option>
				<% } %>
				</select>
			</div>
			<div class="form-group">
				<label>标题</label> <input type="text"
					class="form-control" name="title" id="titile" placeholder="请输入标题">
			</div>
			<div class="form-group">
				<label>作者</label> <input type="text"
					class="form-control" name="author" id="author" placeholder="请输入作者">
			</div>
			<div class="form-group">
				<label>来源</label> <input type="text"
					class="form-control" name="source" id="source" placeholder="请输入新闻来源">
			</div>
			<div class="form-group">
				<label>新闻内容</label> 
				<textarea rows="10" cols="30" name="content" class="form-control"></textarea>
			</div>
		
			<div class="form-group">
				<label>是否热门: </label> <label class="radio-inline"> <input
					type="radio" name="isHot" id="yes" value="1" checked>是
				</label> <label class="radio-inline"> <input type="radio"
					name="isHot" id="no" value="0">否
				</label>
			</div>

			<div class="form-group">
				<label>是否举报: </label> <label class="radio-inline"> <input
					type="radio" name="isReport" id="yes" value="1" checked>是
				</label> <label class="radio-inline"> <input type="radio"
					name="isReport" id="no" value="0">否
				</label>
			</div>

			<button type="submit" class="btn btn-primary">确认</button>
			<input type="button" class="btn btn-primary" value="取消" onClick="location.href='newsManage.jsp'"/>
		</form>
	</div>
</body>
</html>