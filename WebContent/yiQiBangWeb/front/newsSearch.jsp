<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TType,
    cn.uc.model.TNews,
    java.util.*,
    cn.uc.dao.TTypeMapper,
    cn.uc.dao.TNewsMapper,
    cn.uc.dao.impl.TTypeMapperImpl,
    cn.uc.dao.impl.TNewsMapperImpl,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr"%>
<%!
	List<TType> data;
	List<TNews> newsData;
	Result result = new Result();
 	TTypeMapper typeDao = new TTypeMapperImpl();
 	TNewsMapper newsDao = new TNewsMapperImpl();
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
</head>
<body>
    <header>
        <img src="../html/frontImg/logo1.png">
        <div>
            <a href="" class="a1" data-toggle="modal" data-target="#myModal">登录</a>
            <a href="" >下载APP</a>
            <a href="" >反馈</a>
        </div>
    </header>

    <div class="search">
        <input type="text" placeholder="&nbsp;&nbsp;&nbsp;大家都在搜：优才创智获B轮投资">
        <a href=""><img src="../html/frontImg/sousuo.png"></a>
    </div>
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
                    <% 		TNews news = newsData.get(i); %>
                    <% 		String picArr[] = news.getPic().split(","); %>
                        <div class="item <%=i == 0? "active": "" %>">
                            <img src="<%=picArr[0] %>">
                            <div class="carousel-caption">
                                <p><%=news.getTitle() %></p>
                            </div>
                        </div>
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
            <% for(int i = 0; i < newsData.size(); i++) {%>
            <% 		if (i >= 3 && i < 6) {%>
            <% 		TNews news = newsData.get(i); %>
            <% 		String picArr[] = news.getPic().split(",");%>
            <div class="news">
                <p><%=news.getTitle() %></p>
                <div class="newsImgs">
                    <img src="<%=picArr[0] %>">
                    <img src="<%=picArr[1] %>">
                    <img src="<%=picArr[2] %>">
                </div>
                <div class="comments">
                    <img src="../html/frontImg/xiaokeai.png">
                    <span>钻石王老六·30分钟前·评论380次</span>
                </div>
            </div>
            	<% } %>
            <% } %>

          <!--   <div class="news">
                <p>实拍德国的真实农村， 百闻不如一见！</p>
                <div class="newsImgs">
                    <img src="../html/frontImg/village1.png">
                    <img src="../html/frontImg/content_tu_02_13.jpg">
                    <img src="../html/frontImg/content_tu_03_15.jpg">
                </div>
                <div class="comments">
                    <img src="../html/frontImg/xiaokeai.png">
                    <span>钻石王老六·30分钟前·评论380次</span>
                </div>
            </div>

            <div class="news">
                <p>实拍德国的真实农村， 百闻不如一见！</p>
                <div class="newsImgs">
                    <img src="../html/frontImg/village1.png">
                    <img src="../html/frontImg/content_tu_02_13.jpg">
                    <img src="../html/frontImg/content_tu_03_15.jpg">
                </div>
                <div class="comments">
                    <img src="../html/frontImg/xiaokeai.png">
                    <span>钻石王老六·30分钟前·评论380次</span>
                </div>
            </div>
 -->
            <!--底部-->
            <div class="downNew">
                <img src="../html/frontImg/content_tu_10_41.jpg">
                <div class="newsTitle"><p>女人有这三个表现，绝对是和不少男人纠缠过，早就不纯了！</p></div>
                <div class="comments">
                    <img src="../html/frontImg/xiaokeai.png">
                    <span>钻石王老六·30分钟前·评论380次</span>
                </div>
            </div>
        </div>

        <div class="rightDiv">
            <div class="rightNews">
                <div class="hours"><p>24 小时热闻</p></div>
                <div class="rightNew">
                    <img src="../html/frontImg/right_tu_01_03.jpg">
                    <div class="rigNewsTitle"><p>笑死人不偿命的一百种作死的方式，你知道几种？</p></div>
                </div>
                <div class="rightNew">
                    <img src="../html/frontImg/right_tu_01_03.jpg">
                    <div class="rigNewsTitle"><p>笑死人不偿命的一百种作死的方式，你知道几种？</p></div>
                </div>
                <div class="rightNew">
                    <img src="../html/frontImg/right_tu_01_03.jpg">
                    <div class="rigNewsTitle"><p>笑死人不偿命的一百种作死的方式，你知道几种？</p></div>
                </div>
            </div>

            <div class="rightNews">
                <div class="hours"><p>24 小时热闻</p></div>
                <div class="rightNew">
                    <img src="../html/frontImg/right_tu_01_03.jpg">
                    <div class="rigNewsTitle"><p>笑死人不偿命的一百种作死的方式，你知道几种？</p></div>
                </div>
                <div class="rightNew">
                    <img src="../html/frontImg/right_tu_01_03.jpg">
                    <div class="rigNewsTitle"><p>笑死人不偿命的一百种作死的方式，你知道几种？</p></div>
                </div>
                <div class="rightNew">
                    <img src="../html/frontImg/right_tu_01_03.jpg">
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
                                <form class="form-horizontal">
                                    <div class="form-group sjhm username">
                                        <div class="col-sm-12">
                                            <input type="text" class="form-control" id="username" placeholder="用户名/手机/邮箱">
                                        </div>
                                    </div>
                                    <div class="form-group sjhm ">
                                        <div class="col-sm-12 pwd">
                                            <input type="text" class="form-control" id="password" placeholder="请输入密码">
                                            <a href="#">找回密码</a>
                                        </div>
                                    </div>
                                </form>
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
</body>

</html>