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
                        <input type="text" placeholder="新闻类型" name="searchStr" value="<%=searchStr %>">
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
                            <tr>
                            <th>序号</th>
                            <th>名称</th>
                            <th>创建时间</th>
                            <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% for(int i = 0; i < data.size(); i++) {%>
                            <tr>
                                <td><%=i+1%></td>
                                <td><%=data.get(i).getName() %></td>
                                <td><%=DateSimpleStr.getStringDate(data.get(i).getCreatetime()) %></td>
                                <td><a href="typeEdit.jsp?id=<%=data.get(i).getId()%>"><img src="../html/backendImg/public/xiugai.png"></a>
                                <a class="deleteBtn" data-id="<%=data.get(i).getId()%>"><img src="../html/backendImg/public/shanchu.png"></a></td>
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
    	
    	//删除绑定事件
		$('.deleteBtn').click(function(e) {
			if (!confirm('该操作将同样删除相关类型下所有新闻信息,确认删除？')) {
				return false;
			}
			var id = $(this).data('id');
			$.ajax({
				url : "/yiQiBang/TypeServlet",
				data : {
					action : "typeDelete",
					id : id
				},
				dataType : "json",
				timeout : 5000,
				type : "post",
				success : function(data) {
					if (data.retCode == 0) {
						location.reload();
					}
				},
				error : function(e) {
					alert("删除失败" + e);
				}
			});
		});
    	//获取当前页面GET参数
    	var getParams = function(key) {
    		var map = {};
    		var arr = location.search.slice(1).split('&');
    		for(var i = 0; i < arr.length; i++) {
    			if (arr[i] == '') continue;
    			var tmp = arr[i].split('=');
    			map[tmp[0]] = tmp[1] ? decodeURIComponent(tmp[1]) : '';

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