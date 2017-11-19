<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="cn.uc.dao.TCommentMapper,
    cn.uc.dao.impl.TCommentMapperImpl,
    cn.uc.util.Result,
    cn.uc.model.TComment,
    cn.uc.dao.TUserMapper,
    cn.uc.dao.impl.TUserMapperImpl"%>
<%!
	TComment commentData = new TComment();
	TUserMapper userDao = new TUserMapperImpl();
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
		TCommentMapper commDao = new TCommentMapperImpl();
		commentData = (TComment)commDao.selectByPrimaryKey(id).getRetData();	
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
	width: 40%;
	margin: 40px 0 0 40px;
	border: 1px solid gray;
	padding: 10px;
}
</style>
</head>
<body>
	<div class="main">
		<form action="<%=request.getContextPath() %>/CommentServlet?action=commentEdit" method=post>
			
			<input type="hidden" name="id" value="<%=id%>">
			<div class="form-group">
				<label>新闻标题</label> <input type="text"
					class="form-control" disabled name="title" id="titile" value="<%=id > 0 ? commentData.getTnew().getTitle(): ""%>">
			</div>
			<div class="form-group">
				<label>评论用户</label> <input type="text"
					class="form-control" disabled name="username" id="username" value="<%=id > 0 ? userDao.selectNameById(commentData.getUserid()).getRetData(): ""%>">
			</div>
			<div class="form-group">
				<label>评分</label> <input type="text"
					class="form-control" disabled name="score" id="score" value="<%=commentData.getScore()%>">
			</div>
			<div class="form-group">
				<label>评论内容</label> 
				<input type="text"
					class="form-control" name="content" id="content" value="<%=commentData.getContent()%>">
			</div>
		
			<div class="form-group">
				<label>状态可见 </label> <label class="radio-inline"> <input
					type="radio" name="isShow" id="isShow" value="1" <%=commentData.getStatus() == 1 ? "checked" : null %>>是
				</label> <label class="radio-inline"> <input type="radio"
					name="isShow" id="isShow" value="0" <%=commentData.getStatus() == 0 ? "checked" : null %>>否
				</label>
			</div>

			<button type="submit" class="btn btn-primary">确认</button>
			<input type="button" class="btn btn-primary" value="取消" onClick="location.href='commentManage.jsp'"/>
		</form>
	</div>
</body>
</html>