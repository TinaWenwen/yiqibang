<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="cn.uc.model.TType,
    cn.uc.dao.TTypeMapper,
    cn.uc.dao.impl.TTypeMapperImpl,
    cn.uc.util.Result"%>
<%!
	TType typeData = new TType();
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
		TTypeMapper typeDao = new TTypeMapperImpl();
		typeData = (TType)typeDao.selectByPrimaryKey(id).getRetData();
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
	width: 20%;
	margin: 40px 0 0 40px;
	border: 1px solid gray;
	padding: 10px;
}
</style>
</head>
<body>
	<div class="main">
		<form action="<%=request.getContextPath() %>/TypeServlet?action=typeEdit" method=post>
			<input type="hidden" name="id" value="<%=id%>">
			<div class="form-group">
				<label>新闻类型</label> 
				<input type="text" class="form-control" id="InputType" name="type" value="<%=typeData.getName() %>"
					placeholder="新闻类型">
			</div>
			<button type="submit" class="btn btn-primary">确认</button>
			<input type="button" class="btn btn-primary" value="取消" onClick="location.href='newsClassifyManage.jsp'"/>
		</form>
	</div>
</body>
</html>