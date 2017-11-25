<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="cn.uc.model.TNews,
	cn.uc.model.TUser,
	cn.uc.model.TComment,
	java.util.*,
    cn.uc.dao.TNewsMapper,
    cn.uc.dao.TUserMapper,
    cn.uc.dao.TCommentMapper,
    cn.uc.dao.impl.TUserMapperImpl,
    cn.uc.dao.impl.TNewsMapperImpl,
    cn.uc.dao.impl.TCommentMapperImpl,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr,
    javax.servlet.http.HttpSession,
    javax.servlet.http.HttpServletRequest,
    javax.servlet.http.HttpServletResponse"%>
<%!
	List<TComment> commentData;
	TNewsMapper newsDao = new TNewsMapperImpl();
	TCommentMapper commentDao = new TCommentMapperImpl();
	TUserMapper userDao = new TUserMapperImpl();
	int newsId = 0;
%>  
<%
	
	//System.out.println(request.getParameter("newsid"));
	newsId = Integer.parseInt(request.getParameter("newsid"));
	TNews news = (TNews)newsDao.selectByPrimaryKey(newsId).getRetData();
	commentData = (List<TComment>)commentDao.selectByNewsid(newsId).getRetData();
	TUser userLogin = (TUser)session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻</title>
<link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/login1.css">
<link rel="stylesheet" href="../css/news.css">
<link rel="stylesheet" href="../css/frontCss/comment.css">
<link rel="stylesheet" href="../css/frontCss/style.css">
<script src="../jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/front/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="../js/front/jquery.flexText.js"></script>
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
	<div class="container-fluid header">
		<div class="row">
			<div class="col-xs-4">
				<ul id="left">
					<li><a href="newsSearch.jsp" style="color:white;">回到首页</a></li>
				</ul>
			</div>
			<div class="col-xs-4 col-xs-offset-4">
				<ul id="right">
					<li>反馈</li>
					<li>下载APP</li>
					<li>
					<% if (userLogin != null) { %>
					<a href="<%=request.getContextPath() %>/UserServlet?action=userLogout" style="color:white;">退出</a>
					<%} else { %>
						<button type="button" class="btn btn-primary btn-sm"
							data-toggle="modal" data-target="#myModal">登录</button>
					<% } %>
					</li>
					
				</ul>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="main" style="margin:20px 20px; border:none;max-width:600px;">
			<span style="font-size:20px;font-weight:600;margin-left:20px;"><%=news.getTitle() %></span><br>
			<span style="margin-left:30px;"><%=news.getSource() %> <%=news.getAuthor() %> <%=DateSimpleStr.getStringDate(news.getCreatetime()) %></span>
			<br>
			<span style="margin-left:30px;">浏览量：<%=news.getReadcount() == null? "0": news.getReadcount() %>&nbsp;评论人数：<%=news.getCommcount() == null? "0": news.getCommcount()%></span>
			<br>
			<%=news.getContent() %>
		</div>

		<div class="commentAll" style="margin:-250px 0 0 700px;">
			<!--评论区域 begin-->
			<form action="<%=request.getContextPath() %>/CommentServlet" method="get">
			<input type="hidden" name="action" value="insertComment">
			<input type="hidden" name="newsId" value="<%=news.getId() %>">
			<div class="reviewArea clearfix">
				<textarea class="content comment-input"
					placeholder="快来发表你的看法吧" onkeyup="keyUP(this)" name="content"></textarea>
				<button type="submit" class="btn btn-primary" style="margin-left:380px;">评论</button>
			</div>
			</form>
			<!--评论区域 end-->
			<!--回复区域 begin-->
			<% for (int i = 0; i < commentData.size(); i++ ) {%>
			<%		int userId = commentData.get(i).getUserid(); %>
			<%		TUser user = (TUser)userDao.selectByPrimaryKey(userId).getRetData(); %>
			<div class="comment-show">
				<div class="comment-show-con clearfix">
					<div class="comment-show-con-img pull-left">
						<img src="/yiQiBang/headImg/<%=user.getHeadimg() %>" alt="" style="width:50px;height=50px;">
					</div>
					<div class="comment-show-con-list pull-left clearfix">
						<div class="pl-text clearfix">
							<a href="#" class="comment-size-name"><%=user.getUsername() %> : </a> <span
								class="my-pl-con">&nbsp;<%=commentData.get(i).getContent() %></span>
						</div>
						<div class="date-dz">
							<span class="date-dz-left pull-left comment-time"><%=DateSimpleStr.getStringDate(commentData.get(i).getCreatetime()) %></span>
							<div class="date-dz-right pull-right comment-pl-block">
								<a href="javascript:;" class="removeBlock">删除</a> <span
									class="pull-left date-dz-line">|</span> <a href="javascript:;"
									class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞
									(<i class="z-num"><%=commentData.get(i).getThumbscount() %></i>)</a>
							</div>
						</div>
						<div class="hf-list-con"></div>
					</div>
				</div>
			</div>
			<% } %>
			<!--回复区域 end-->
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header top">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<span class="modal-title" id="myModalLabel">登录账户</span>
				</div>
				<div class="modal-body">
					<div id="container">
						<div class="top3">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#home"
									aria-controls="home" role="tab" data-toggle="tab">账号登录</a></li>
								<li role="presentation"><a href="#profile"
									aria-controls="profile" role="tab" data-toggle="tab">短信登录</a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="home">
									<form class="form-horizontal" action="/yiQiBang/UserServlet?action=userLogin" method="post" onsubmit="return checkValue()">
										<div class="form-group sjhm username">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="username" name="username"
													placeholder="用户名/手机/邮箱">
											</div>
										</div>
										<div class="form-group sjhm ">
											<div class="col-sm-12 pwd">
												<input type="text" class="form-control" id="password" name="password"
													placeholder="请输入密码"> <a href="#">找回密码</a>
											</div>
										</div>
										<div class="form-group">
											<p id="tip" class="col-sm-offset-4" style="color:red">${sessionScope.tip}<%session.setAttribute("tip", ""); %></p>
										</div>
									<div class="checkbox">
										<label> <input type="checkbox">记住密码
										</label>&nbsp;&nbsp;&nbsp; <label> <input type="checkbox">自动登录
										</label> <label> <a href="register.html">注册账号</a></label>
									</div>
									<div>
										<input type="submit" value="登录" id="dl" class="btn">
									</div>
									
									</form>
									<div class="pic">
										<div class="order">
											<span style="white-space: pre"></span><span class="line"></span>
											<span style="white-space: pre"></span><span class="txt">其他登录方式</span>
											<span style="white-space: pre"></span><span class="line"></span>
										</div>
										<img src="../html/frontImg/qq.png" alt=""> <img
											src="../html/frontImg/weixin.png" alt=""> <img
											src="../html/frontImg/xinlang.png" alt="">
									</div>
								</div>
								<div role="tabpanel" class="tab-pane" id="profile">123</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>