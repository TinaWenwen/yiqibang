<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TType,
    cn.uc.model.TNews,
    cn.uc.dao.TTypeMapper,
    cn.uc.dao.TNewsMapper,
    cn.uc.dao.impl.TNewsMapperImpl,
    cn.uc.dao.impl.TTypeMapperImpl,
    java.util.*,
    cn.uc.util.Result,
    cn.uc.util.Constants"%>

<%!	List<TType> typeData;
	TNews newsData = new TNews();
	TNewsMapper newsDao = new TNewsMapperImpl();
	Result result = new Result();
	TTypeMapper typeDao = new TTypeMapperImpl();
	int id = 0;%>

<%
	result = typeDao.selectAllType();
	typeData = (List<TType>) result.getRetData();

	//判断id是否存在，区分编辑还是新增
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (NumberFormatException e) {
		id = 0;
	}
	//编辑
	if (id > 0) {
		newsData = (TNews) newsDao.selectByPrimaryKey(id).getRetData();
		//System.out.print(newsData.getType());
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
<!-- 配置文件 -->
<script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
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
		<form action="<%=request.getContextPath() %>/NewsServlet?action=newsEdit" method=post>
			<input type="hidden" name="id" value="<%=id%>">
			<div class="form-group">
				<label>类型</label>
				<select class="form-control" id="newType" name="newType">
				<% for(int i = 0; i < typeData.size(); i++) {%>
					<option value="<%=typeData.get(i).getId() %>" <%=id > 0 ? (newsData.getType().getId().equals(typeData.get(i).getId()) ? "selected" : ""): "" %>><%=typeData.get(i).getName() %></option>
				<%} %>
				</select>
			</div>
			<div class="form-group">
				<label>标题</label> <input type="text"
					class="form-control" name="title" id="titile" value="<%=id > 0 ? newsData.getTitle(): "" %>" placeholder="请输入标题">
			</div>
			<div class="form-group">
				<label>作者</label> <input type="text"
					class="form-control" name="author" id="author" value="<%=id > 0 ? newsData.getAuthor(): "" %>" placeholder="请输入作者">
			</div>
			<div class="form-group">
				<label>来源</label> <input type="text"
					class="form-control" name="source" id="source" value="<%=id > 0 ? newsData.getSource(): "" %>" placeholder="请输入新闻来源">
			</div>
			<div class="form-group">
				<label>新闻内容</label>
				<script id="content_container" name="content" type="text/plain">
				<%=id > 0 ? newsData.getContent(): "" %>
    			</script>
			</div>
		
			<div class="form-group">
				<label>是否热门: </label> <label class="radio-inline"> <input
					type="radio" name="isHot" id="yes" value="1" <%=id > 0 ? (newsData.getIfhot()? "checked" : ""): "checked" %>>是
				</label> <label class="radio-inline"> <input type="radio"
					name="isHot" id="no" value="0" <%=id > 0 ? (!newsData.getIfhot()? "checked" : ""): "" %>  >否
				</label>
			</div>

			<div class="form-group">
				<label>是否举报: </label> <label class="radio-inline"> <input
					type="radio" name="isReport" id="yes" value="1" <%=id > 0 ? (newsData.getIfreport()? "checked" : ""): "" %>>是
				</label> <label class="radio-inline"> <input type="radio"
					name="isReport" id="no" value="0" <%=id > 0 ? (!newsData.getIfreport()? "checked" : ""): "checked" %>>否
				</label>
			</div>

			<button type="submit" class="btn btn-primary">确认</button>
			<input type="button" class="btn btn-primary" value="取消" onClick="location.href='newsManage.jsp'"/>
		</form>
	</div>
	<script>
	jQuery(document).ready(function() {
		var ue = UE.getEditor('content_container', {
			initialFrameHeight : 350
		});
	});
	</script>
</body>
</html>