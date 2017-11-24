<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="cn.uc.model.TNews,
	cn.uc.model.TUser,
	java.util.*,
    cn.uc.dao.TNewsMapper,
    cn.uc.dao.TUserMapper,
    cn.uc.dao.impl.TUserMapperImpl,
    cn.uc.dao.impl.TNewsMapperImpl,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr,
    javax.servlet.http.HttpSession,
    javax.servlet.http.HttpServletRequest,
    javax.servlet.http.HttpServletResponse"%>
<%!
	List<TNews> newsData;
	TNewsMapper newsDao = new TNewsMapperImpl();
%>  
<%
	int newsId = Integer.parseInt(request.getParameter("newsid"));
	TNews news = (TNews)newsDao.selectByPrimaryKey(newsId).getRetData();
	//System.out.println(news);
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
						<button type="button" class="btn btn-primary btn-sm"
							data-toggle="modal" data-target="#myModal">登录</button>
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
			<div class="reviewArea clearfix">
				<textarea class="content comment-input"
					placeholder="快来发表你的看法吧" onkeyup="keyUP(this)"></textarea>
				<a href="javascript:;" class="plBtn">评论</a>
			</div>
			<!--评论区域 end-->
			<!--回复区域 begin-->
			<div class="comment-show">
				<div class="comment-show-con clearfix">
					<div class="comment-show-con-img pull-left">
						<img src="images/header-img-comment_03.png" alt="">
					</div>
					<div class="comment-show-con-list pull-left clearfix">
						<div class="pl-text clearfix">
							<a href="#" class="comment-size-name">张三 : </a> <span
								class="my-pl-con">&nbsp;来啊 造作啊!</span>
						</div>
						<div class="date-dz">
							<span class="date-dz-left pull-left comment-time">2017-5-2
								11:11:39</span>
							<div class="date-dz-right pull-right comment-pl-block">
								<a href="javascript:;" class="removeBlock">删除</a> <a
									href="javascript:;"
									class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span
									class="pull-left date-dz-line">|</span> <a href="javascript:;"
									class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞
									(<i class="z-num">666</i>)</a>
							</div>
						</div>
						<div class="hf-list-con"></div>
					</div>
				</div>
			</div>
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
									<form class="form-horizontal">
										<div class="form-group sjhm username">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="username"
													placeholder="用户名/手机/邮箱">
											</div>
										</div>
										<div class="form-group sjhm ">
											<div class="col-sm-12 pwd">
												<input type="text" class="form-control" id="password"
													placeholder="请输入密码"> <a href="#">找回密码</a>
											</div>
										</div>
									</form>
									<div class="checkbox">
										<label> <input type="checkbox">记住密码
										</label>&nbsp;&nbsp;&nbsp; <label> <input type="checkbox">自动登录
										</label> <label> <a href="register.html">注册账号</a></label>
									</div>
									<div>
										<input type="submit" value="登录" id="dl" class="btn">
									</div>

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
<!--textarea高度自适应-->
<script type="text/javascript">
    $(function () {
        $('.content').flexText();
    });
</script>
<!--textarea限制字数-->
<script type="text/javascript">
    function keyUP(t){
        var len = $(t).val().length;
        if(len > 139){
            $(t).val($(t).val().substring(0,140));
        }
    }
</script>
<!--点击评论创建评论条-->
<script type="text/javascript">
    $('.commentAll').on('click','.plBtn',function(){
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        console.log(oSize);
        //动态创建评论模块
        oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="images/header-img-comment_03.png" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">David Beckham : </a> <span class="my-pl-con">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
        if(oSize.replace(/(^\s*)|(\s*$)/g, "") != ''){
            $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
            $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
        }
    });
</script>
<!--点击回复动态创建回复块-->
<script type="text/javascript">
    $('.comment-show').on('click','.pl-hf',function(){
        //获取回复人的名字
        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        //回复@
        var fhN = '回复@'+fhName;
        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
        //显示回复
        if($(this).is('.hf-con-block')){
            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
            $(this).removeClass('hf-con-block');
            $('.content').flexText();
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
            //input框自动聚焦
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
        }else {
            $(this).addClass('hf-con-block');
            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
        }
    });
</script>
<!--评论回复块创建-->
<script type="text/javascript">
    $('.comment-show').on('click','.hf-pl',function(){
        var oThis = $(this);
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
        console.log(oHfVal)
        var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        var oAllVal = '回复@'+oHfName;
        if(oHfVal.replace(/^ +| +$/g,'') == '' || oHfVal == oAllVal){

        }else {
            $.getJSON("json/pl.json",function(data){
                var oAt = '';
                var oHf = '';
                $.each(data,function(n,v){
                    delete v.hfContent;
                    delete v.atName;
                    var arr;
                    var ohfNameArr;
                    if(oHfVal.indexOf("@") == -1){
                        data['atName'] = '';
                        data['hfContent'] = oHfVal;
                    }else {
                        arr = oHfVal.split(':');
                        ohfNameArr = arr[0].split('@');
                        data['hfContent'] = arr[1];
                        data['atName'] = ohfNameArr[1];
                    }

                    if(data.atName == ''){
                        oAt = data.hfContent;
                    }else {
                        oAt = '回复<a href="#" class="atName">@'+data.atName+'</a> : '+data.hfContent;
                    }
                    oHf = data.hfName;
                });

                var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con">'+oAt+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>';
                oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
            });
        }
    });
</script>
<!--删除评论块-->
<script type="text/javascript">
    $('.commentAll').on('click','.removeBlock',function(){
        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
        if(oT.siblings('.all-pl-con').length >= 1){
            oT.remove();
        }else {
            $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
            oT.remove();
        }
        $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

    })
</script>
<!--点赞-->
<script type="text/javascript">
    $('.comment-show').on('click','.date-dz-z',function(){
        var zNum = $(this).find('.z-num').html();
        if($(this).is('.date-dz-z-click')){
            zNum--;
            $(this).removeClass('date-dz-z-click red');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').removeClass('red');
        }else {
            zNum++;
            $(this).addClass('date-dz-z-click');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').addClass('red');
        }
    })
</script>
</body>
</html>