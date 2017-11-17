<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TType,
    java.util.*,
    cn.uc.dao.TTypeMapper,
    cn.uc.dao.impl.TTypeMapperImpl,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr,
    cn.uc.util.Constants"%>
 
<%!
	List<TType> data;
	Result result = new Result();
 	Result countsResult = new Result();
 	TTypeMapper typeDao = new TTypeMapperImpl();
%>
<%
	String searchStr = request.getParameter("searchStr");
	String pageStr = request.getParameter("page");

	int pageParam;
	int maxPage;
	if (searchStr == null){
		searchStr = "";
	}

	countsResult = typeDao.selectAllCounts(searchStr);
	int counts = (int)countsResult.getRetData();
  	maxPage = (int)Math.ceil((float)counts / Constants.PAGE_SIZE);

	try{
		pageParam = Integer.parseInt(pageStr);
		if (pageParam <= 0){
			pageParam = 1;
		}
		if (pageParam > maxPage){
			pageParam = maxPage;
		}
	}catch  (NumberFormatException e){
		pageParam = 1;
		}
	
	/* System.out.println("共有" + counts + "条数据");
	System.out.println("一共有" + maxPage + "页");
	System.out.println("当前页为" + pageParam); */
	result = typeDao.selectTypeByLike(searchStr,pageParam);
	data = (List<TType>)result.getRetData();
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻分类管理</title>
<link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/BackendCss/backend.css">
<script src="../jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../bootstrap/bootstrap/js/bootstrap-paginator.min.js"></script>
</head>
<body>
	<div class="my_container">
        <%@ include file="header.jsp" %>

        <div class="context">
            <%@ include file="menu.jsp" %>

            <div class="main">
                <div class="tableTop">
                <form method="get">
                    <div class="searchUser">
                        <input type="text" placeholder="新闻类型" name="searchStr">
                        <a id="selectImg"><img src="../html/backendImg/public/fangdajing.png"></a>
                    </div>
                </form>
                    <div class="addDiv">
                        <a href="typeEdit.jsp"><span class="glyphicon glyphicon-plus"></span></a>
                        添加
                    </div>
                </div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active">
                        <table class="table table-bordered">
                            <thead>
                            <th>序号</th>
                            <th>名称</th>
                            <th>创建时间</th>
                            <th>操作</th>
                            </thead>
                            <tbody>
                            <% for(int i = 0; i < data.size(); i++) {%>
                            <tr>
                                <td><%=i+1%></td>
                                <td><%=data.get(i).getName() %></td>
                                <td><%=DateSimpleStr.getStringDate(data.get(i).getCreateTime()) %></td>
                                <td><a href="typeEdit.jsp"><img src="../html/backendImg/public/xiugai.png"></a>
                                <a><img src="../html/backendImg/public/shanchu.png"></a></td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                        <ul id="myPagination"></ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
    jQuery(document).ready(function(){
    	jQuery('#selectImg').click(function(e){
    		jQuery('form').submit();
      	}); 
    	
    	//获取当前页面GET参数
    	var getParams = function(key) {
    		var map = {};
    		var arr = location.search.slice(1).split('&');
    		for(var i = 0; i < arr.length; i++) {
    			if (arr[i] == '') continue;
    			var tmp = arr[i].split('=');
    			map[tmp[0]] = tmp[1] ? tmp[1] : '';
    		}
    		
    		if (key) {
    			return map[key];
    		} else {
    			return map;
    		}
    	}

    	var options = {
    		bootstrapMajorVersion : 3,
    		currentPage: <%=pageParam %>,
    		totalPages: <%=Math.max(1, maxPage) %>,
    		pageUrl: function(type, page, current){
    			var params = getParams();
    			params['page'] = page;
    			return location.origin + location.pathname + '?' + $.param(params);
    		}
    	}

    	$('#myPagination').bootstrapPaginator(options);	
    });
</script>
<script>
$(function(){
	$('.leftContext li:eq(4)').addClass('active');
});
</script>
</body>
</html>