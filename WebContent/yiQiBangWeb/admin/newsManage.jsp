
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TNews,
    java.util.*,
    cn.uc.dao.*,
    cn.uc.dao.impl.*,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr,
    cn.uc.util.Constants"%>

<%!
		List<TNews> data;
 	    Result result = new Result();
 	    Result countsResult = new Result();
 		TNewsMapper newsDao = new TNewsMapperImpl(); 
%>  
<%
		//获取传来的查询条件
		String searchStr = request.getParameter("searchStr");
		//获取传来的页码参数
		String pageStr = request.getParameter("page");
		//当前显示的页码
		int pageParam;
		int maxPage;
		if (searchStr == null){
			searchStr = "";
		}
		//获取当前查询的数据的最大页数
		countsResult = newsDao.selectAllCounts(searchStr);
		int counts = (int)countsResult.getRetData();
		//System.out.println(counts);
		maxPage = (int)Math.ceil((float)counts / Constants.PAGE_SIZE);
		//System.out.println(maxPage);
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
		//获取查询列表
 		result = newsDao.selectNewsByLike(searchStr,pageParam);
		data = (List<TNews>)result.getRetData();
		//System.out.println(data);
%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻管理</title>
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
                        <input type="text" placeholder="类型/来源/标题/作者/内容" value="<%=searchStr %>" name="searchStr" style="width: 200px;">
                        <a id="selectImg"><img src="../html/backendImg/public/fangdajing.png"></a>
                    </div>
                    </form>
                    <div class="addDiv">
                        <a href="newsEdit.jsp"><span class="glyphicon glyphicon-plus"></span></a>
                        添加
                    </div>
                </div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                            <th>序号</th>
                            <th>标题</th>
                            <th>来源</th>
                            <th>分类</th>
                            <th>浏览数量</th>
                            <th>评论数量</th>
                            <th>分享数量</th>
                            <th>作者</th>
                            <th>创建时间</th> 
                            <th>内容</th>
                            <th>热推</th>
                            <th>举报</th>
                            <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% for(int i = 0; i < data.size(); i++) {%>
                            <tr>
                                <td><%=i+1%></td>
                                <td><%=data.get(i).getTitle() %></td>
                                <td><%=data.get(i).getSource() %></td>
                                <td><%=data.get(i).getType().getName() %></td>
                                <td><%=data.get(i).getReadcount() == null? "0": data.get(i).getReadcount() %></td>
                                <td><%=data.get(i).getCommcount() == null? "0": data.get(i).getCommcount()%></td>
                                <td><%=data.get(i).getSharecount() == null? "0": data.get(i).getSharecount() %></td>
                                <td><%=data.get(i).getAuthor() %></td>
                                <td><%=DateSimpleStr.getStringDate(data.get(i).getCreatetime()) %></td>
                                <td><pre><%=data.get(i).getContent().length() > 10 ? data.get(i).getContent().substring(0,10) + "。。。" : data.get(i).getContent()%></pre></td>
                                <td><%=data.get(i).getIfhot()?"是" : "否" %></td>
                                <td><%=data.get(i).getIfreport()?"是" : "否" %></td>
                                <td><a href="newsEdit.jsp?id=<%=data.get(i).getId()%>"><img src="../html/backendImg/public/xiugai.png"></a>
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
			if (!confirm('删除新闻也将删除该新闻所有评论，确认删除？')) {
				return false;
			}
			var id = $(this).data('id');
			$.ajax({
				url : "/yiQiBang/NewsServlet",
				data : {
					action : "newsDelete",
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
	$('.leftContext li:eq(1)').addClass('active');
});
</script>
</body>
</html>