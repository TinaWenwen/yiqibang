<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TType,
    cn.uc.model.TNews,
    cn.uc.model.TUser,
    cn.uc.model.TComment,
    java.util.*,
    cn.uc.dao.*,
    cn.uc.dao.impl.*,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr,
    cn.uc.util.Constants,
    javax.servlet.http.HttpSession,
    javax.servlet.http.HttpServletRequest,
    javax.servlet.http.HttpServletResponse"%>
<%!
	
	List<TNews> newsData;
	TComment latestComment;
	Result result = new Result();
	Result countsResult = new Result();
 	TNewsMapper newsDao = new TNewsMapperImpl();
 	TCommentMapper commentDao = new TCommentMapperImpl();
 	TUserMapper userDao = new TUserMapperImpl();
 	
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
	
	newsData = (List<TNews>)newsDao.selectNewsByLike(searchStr,pageParam).getRetData();
	System.out.println(newsData);
	//用户界面初始化
	String userName = "";
	String imgName = "default.jpg";
	TUser user = (TUser)session.getAttribute("user");
	if (user != null) {
		userName = user.getUsername();
		imgName = user.getHeadimg();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果</title>
 <link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="../css/newsSearch.css">
 <link rel="stylesheet" href="../css/login1.css">
 <script src="../jquery/jquery-3.2.1.min.js"></script>
 <script src="../bootstrap/bootstrap/dist/js/bootstrap.min.js"></script>
 <script src="../js/newsSearch.js"></script>
 <script src="../bootstrap/bootstrap/js/bootstrap-paginator.min.js"></script>
</head>
<body>
<header>
		<a href="newsSearch.jsp" style="color:white;line-height:30px;margin-left:30px;">返回首页</a>
        <% if (user != null) { %>
        <a href="headSet.jsp" style="width:30px;height:30px;"><img src="/yiQiBang/headImg/<%=imgName %>" style="width:25px;height:25px;margin-left:950px;"></a>
        <span style="color:white;line-height:30px;"><%=userName %></span>
        	<%} %>
        <div>
        <% if (user != null) { %>
        		<a href="<%=request.getContextPath() %>/UserServlet?action=userLogout">退出</a>
        	<% } else {%>
            <a href="" class="a1" data-toggle="modal" data-target="#myModal" >登录</a>
            		<% } %>
            <a href="" >下载APP</a>
            <a href="" >反馈</a>
        </div>
    </header>
	<form method="get">
    <div class="search" style="margin-left:30px">
        <input type="text" placeholder="&nbsp;&nbsp;&nbsp;" name="searchStr" value="<%=searchStr %>">
        <a id="selectImg"><img src="../html/frontImg/sousuo.png"></a>
    </div>
    </form>
     <div class="middle">
     		<% if (newsData.size() != 0) { %>
           	 <% for(int i = 0; i < newsData.size(); i++) {
            		TNews news = newsData.get(i);
            		int newsid = news.getId();
            		latestComment = (TComment)commentDao.selectLatestComment(newsid).getRetData();
            		TUser latestCommentUser = new TUser();
            		if (latestComment != null) {
            			int uid = latestComment.getUserid();
                		latestCommentUser = (TUser)userDao.selectByPrimaryKey(uid).getRetData();
            		}
             		String picArr[] = news.getPic().split(",");
             		long currentTime = System.currentTimeMillis();
             		%>
            <div class="news" style="margin-left:30px">
                <a href="news.jsp?newsid=<%=news.getId()%>"><p><%=news.getTitle() %></p></a>
                <div class="newsImgs">
                    <a href="news.jsp?newsid=<%=news.getId()%>"><img src="<%=picArr[0] %>" style="height:140px;width:228px;"></a>
                </div>
                <div class="comments">
                    <img src="/yiQiBang/headImg/<%=latestComment == null? "" : latestCommentUser.getHeadimg()%>">
                    <span><%=latestComment == null ? "" : latestCommentUser.getUsername() %>·<%=latestComment == null? "暂无评论" :+(currentTime - latestComment.getCreatetime().getTime())/(1000 * 60 * 60)+ "小时前" %>·评论<%=news.getCommcount() %>次</span>
                    <% if (news.getIfhot()) { %>
                    <span class="label label-danger">热点</span>
                    <% } %>
                </div>
            </div>
            <% } %>
          <% } else {%>
          	<div style="margin-left:30px;;color:grey;font-weight:600;font-size:20px;">
          	<img src="../html/frontImg/cry.png" style="width:200px;">
          	啊哦，没有相关新闻呢，换个关键词试试？</div>
          <% } %>
            <ul id="myPagination" style="float:left;margin-left:30px;"></ul>
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
</body>
</html>