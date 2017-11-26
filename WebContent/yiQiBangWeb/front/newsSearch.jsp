<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TType,
    cn.uc.model.TNews,
    cn.uc.model.TUser,
    cn.uc.model.TComment,
    java.util.*,
    cn.uc.dao.TTypeMapper,
    cn.uc.dao.TNewsMapper,
    cn.uc.dao.TCommentMapper,
    cn.uc.dao.TUserMapper,
    cn.uc.dao.impl.TTypeMapperImpl,
    cn.uc.dao.impl.TNewsMapperImpl,
    cn.uc.dao.impl.TCommentMapperImpl,
    cn.uc.dao.impl.TUserMapperImpl,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr,
    javax.servlet.http.HttpSession,
    javax.servlet.http.HttpServletRequest,
    javax.servlet.http.HttpServletResponse"%>
<%!
	List<TType> data;
	List<TNews> newsData;
	TComment latestComment;
	Result result = new Result();
 	TTypeMapper typeDao = new TTypeMapperImpl();
 	TNewsMapper newsDao = new TNewsMapperImpl();
 	TCommentMapper commentDao = new TCommentMapperImpl();
 	TUserMapper userDao = new TUserMapperImpl();
 	
%>

<%
	int typeId = 0;
	try {
		typeId = Integer.parseInt(request.getParameter("typeid"));
		if (typeId <= 0) {
			typeId = 1;
		}
	} catch (NumberFormatException e) {
		typeId = 1;
	}
	
	newsData = (List<TNews>)newsDao.selectNewsByTypeId(typeId).getRetData();
	result = typeDao.selectAllType();
	data = (List<TType>) result.getRetData();
	
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>宜企邦</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/newsSearch.css">
    <link rel="stylesheet" href="../css/login1.css">
    <script src="../jquery/jquery-3.2.1.min.js"></script>
    <script src="../bootstrap/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../js/newsSearch.js"></script>
    <script>
    	function checkValue(){
    		var username=$('#username').val();
    		var password=$('#password').val();
    		if(username=="" || password==""){
    			$('#tip').text("用户名、密码不能为空");
    			return false;
    		}else{
    			$('#tip').text("");
    			return true;
    		}
    	}
    </script>
</head>
<body>
    <header>
        <img id="logoheadImg" src="../html/frontImg/logo1.png">
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
	<form method="get" id="newsSearchForm" action="newsResult.jsp">
    <div class="search">
        <input type="text" placeholder="&nbsp;&nbsp;&nbsp;大家都在搜：优才创智获B轮投资" name="searchStr">
        <a id="selectImg"><img src="../html/frontImg/sousuo.png"></a>
    </div>
    </form>
    <div class="container">
        <div class="leftDiv">
            <ul id="typeList">
            <% for(int i = 0; i < data.size(); i++) {%>
                <li><a class="<%=(i == 0 ? "firstLi": "") %>" href="newsSearch.jsp?typeid=<%=data.get(i).getId() %>"><%=data.get(i).getName() %></a></li>
              <% } %>
            </ul> 
        </div>

        <div class="middle">
            <div class="banner">
                <div id="myCarousel" class="carousel slide">
                    <!-- 轮播（Carousel）指标 -->
                    <ol class="carousel-indicators">
                    <% for(int i = 0; i < newsData.size(); i++) {%>
                    <%	if (i < 3) {%>
                        <li data-target="#myCarousel" data-slide-to="<%=i %>" class="<%=i == 0? "active":"" %>"></li>
                         	<% } %>
                         <% } %>
                    </ol>
                    <!-- 轮播（Carousel）导航 -->
                    <div class="carousel-inner">
                    <% for(int i = 0; i < newsData.size(); i++) {%>
                    <%		if (i < 3) {%>
                    <% 		TNews news = newsData.get(i); %>
                    <% 		String picArr[] = news.getPic().split(","); %>
                        <div class="item <%=i == 0? "active": "" %>">
                            <a href="news.jsp?newsid=<%=news.getId()%>"><img src="<%=picArr[0] %>" style="max-height:240px;max-width:714px;"></a>
                            <div class="carousel-caption">
                                <p><%=news.getTitle() %></p>
                            </div>
                        </div>
                        	 <% } %>
                        <% } %>
                    </div>

                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <% for(int i = 0; i < newsData.size(); i++) {
            		if (i >= 3 && i < 6) {
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
            <div class="news">
                <a href="news.jsp?newsid=<%=news.getId()%>"><p><%=news.getTitle() %></p></a>
                <div class="newsImgs">
                    <a href="news.jsp?newsid=<%=news.getId()%>"><img src="<%=picArr[0] %>" style="height:140px;width:228px;"></a>
                    <a href="news.jsp?newsid=<%=news.getId()%>"><img src="<%=picArr[1] %>" style="height:140px;width:228px;"></a>
                    <a href="news.jsp?newsid=<%=news.getId()%>"><img src="<%=picArr[2] %>" style="height:140px;width:228px;"></a>
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
            <% } %>

            <!--底部-->
             <div class="downNew">
            <% for(int i = 0; i < newsData.size(); i++) {%> 
            <% 		if (i == 6) {%> 
            <%  TNews newsDown = newsData.get(6);
            	int newsid = newsDown.getId();
    			latestComment = (TComment)commentDao.selectLatestComment(newsid).getRetData();
    			TUser latestCommentUser = new TUser();
    			if (latestComment != null) {
    				int uid = latestComment.getUserid();
        			latestCommentUser = (TUser)userDao.selectByPrimaryKey(uid).getRetData();
    			}
            	String picArrDown[] = newsDown.getPic().split(",");
            	long currentTime = System.currentTimeMillis(); %>
                <a href="news.jsp?newsid=<%=newsDown.getId()%>"><img src="<%=picArrDown[0] %>" style="height:140px;width:228px;"></a>
                <div class="newsTitle">
                	<a href="news.jsp?newsid=<%=newsDown.getId()%>"><p style="font-size: 16px; font-weight: 600;color:black;"><%=newsDown.getTitle() %></p></a>
               	 	<img src="/yiQiBang/headImg/<%=latestComment == null? "" : latestCommentUser.getHeadimg()%>" style="margin-top:0px;">
               		<span><%=latestComment == null ? "" : latestCommentUser.getUsername() %>·<%=latestComment == null? "暂无评论" :+(currentTime - latestComment.getCreatetime().getTime())/(1000 * 60 * 60)+ "小时前" %>·评论<%=newsDown.getCommcount() %>次</span>
               		 <% if (newsDown.getIfhot()) { %>
                    <span class="label label-danger">热点</span>
                    <% } %>
                </div>
                	<% } %> 
                 <% } %> 
            </div> 
        </div>

        <div class="rightDiv">
            <div class="rightNews">
                <div class="hours"><p>24 小时热闻</p></div>
                <div class="rightNew">
                    <img style="width:66px;height:66px;" src="../html/frontImg/taylor.jpg">
                    <div class="rigNewsTitle"><p>笑死人不偿命的一百种作死的方式，你知道几种？</p></div>
                </div>
                <div class="rightNew">
                    <img style="width:66px;height:66px;" src="../html/frontImg/taylor.jpg">
                    <div class="rigNewsTitle"><p>笑死人不偿命的一百种作死的方式，你知道几种？</p></div>
                </div>
                <div class="rightNew">
                    <img style="width:66px;height:66px;" src="../html/frontImg/taylor.jpg">
                    <div class="rigNewsTitle"><p>笑死人不偿命的一百种作死的方式，你知道几种？</p></div>
                </div>
            </div>

            <div class="rightNews">
                <div class="hours"><p>热搜排行榜</p></div>
                <div class="rightNew">
                    <img style="width:66px;height:66px;" src="../html/frontImg/taylor.jpg">
                    <div class="rigNewsTitle"><p>笑死人不偿命的一百种作死的方式，你知道几种？</p></div>
                </div>
                <div class="rightNew">
                    <img style="width:66px;height:66px;" src="../html/frontImg/taylor.jpg">
                    <div class="rigNewsTitle"><p>笑死人不偿命的一百种作死的方式，你知道几种？</p></div>
                </div>
                <div class="rightNew">
                    <img style="width:66px;height:66px;" src="../html/frontImg/taylor.jpg">
                    <div class="rigNewsTitle"><p>笑死人不偿命的一百种作死的方式，你知道几种？</p></div>
                </div>
            </div>

            <div class="rightDownNews">
                <div class="more"><p>更多</p></div>
                <div class="rigDownLists">
                    <ul>
                        <li>关于头条</li>
                        <li>加入头条</li>
                        <li>媒体报道</li>
                        <li>媒体合作</li>
                        <li>产品合作</li>
                        <li>合作说明</li>
                        <li>广告投放</li>
                        <li>联系我们</li>
                        <li>用户协议</li>
                        <li>侵权投诉</li>
                        <li>廉洁举报</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header top">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <span class="modal-title" id="myModalLabel">登录账户</span>
            </div>
            <div class="modal-body">
                <div id="container">
                    <div class="top3">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                                                      data-toggle="tab">账号登录</a></li>
                            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">短信登录</a>
                            </li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="home">
                                <form class="form-horizontal" action="/yiQiBang/UserServlet?action=userLogin" method="post" onsubmit="return checkValue()">
                                    <div class="form-group sjhm username">
                                        <div class="col-sm-12">
                                            <input type="text" class="form-control" id="username" name="username" placeholder="用户名/手机/邮箱">
                                        </div>
                                    </div>
                                    <div class="form-group sjhm ">
                                        <div class="col-sm-12 pwd">
                                            <input type="text" class="form-control" id="password" name="password" placeholder="请输入密码">
                                            <a href="#">找回密码</a>
                                        </div>
                                    </div>
                                  <div class="form-group">
									<span id="tip" class="col-sm-offset-4" style="color:red;margin-right:5px;">${sessionScope.tip}<%session.setAttribute("tip", ""); %></span>
								  </div>   
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox">记住密码
                                    </label>&nbsp;&nbsp;&nbsp;
                                    <label>
                                        <input type="checkbox">自动登录
                                    </label>
                                    <label> <a href="register.jsp">注册账号</a></label>
                                </div>
                                <div><input type="submit" value="登录" id="dl" class="btn"></div>
							</form>
                                <div class="pic">
                                    <div class="order">
                                        <span style="white-space:pre"></span><span class="line"></span>
                                        <span style="white-space:pre"></span><span class="txt">其他登录方式</span>
                                        <span style="white-space:pre"></span><span class="line"></span>
                                    </div>
                                    <img src="../html/frontImg/qq.png" alt="">
                                    <a href="../html/weChatLogin.html"><img src="../html/frontImg/weixin.png" alt=""></a>
                                    <img src="../html/frontImg/xinlang.png" alt="">
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="profile">lalalalalalal</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	$(document).ready(function(){
		jQuery('#selectImg').click(function(e){
    		jQuery('#newsSearchForm').submit();
      	}); 
	});
</script>
</body>

</html>