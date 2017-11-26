<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/sign.css">
    <script src="../jquery/jquery-3.2.1.min.js"></script>
    <script>
    	function checkValue(){
    		var username=$('#username').val();
    		var password=$('#password').val();
    		var rePassword=$('#rePassword').val();
    		if(username=="" || password=="" || rePassword==""){
    			$('#tip').text("用户名、密码不能为空");
    			return false;
    		}else if (password != rePassword){
    			$('#tip').text("两次密码输入不一致！");
    			return false;
    		}else {
    			$('#tip').text("");
    			return true;
    		}
    	}
    </script>
    <style>
        .midDiv{
            margin-left: 40px;
        }

    </style>
</head>
<body>
    <header>
        <a style="color=white;" href="newsSearch.jsp"><span>宜企邦首页</span></a>
       <!--  <a href="">登录通行证 > </a> -->
    </header>

    <div class="main">
        <img src="../html/frontImg/logo.png">
        <div class="contentDiv">
            <div class="topDiv">
                <div class="phone">
                    <img src="../html/frontImg/shoujiicon.png">账号注册
                </div>
               <!--  <div class="email">
                    <img src="../html/frontImg/mailicon.png">邮箱
                </div> -->
            </div>
			<form action="/yiQiBang/UserServlet" method="post" onsubmit="return checkValue()">
			<input type="hidden" name="action" value="userRegister">
            <div class="midDiv">
                <div class="number">
                    <span class="pre">用户名&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <input type="text" class="numIpt" name="username" id="username">
                    <span class="tips">注册成功后即可使用该用户名登陆</span>
                </div>
                <div class="number">
                    <span class="pre">设置密码</span>
                    <input type="password" class="numIpt" name="password" id="password">
                    <span class="tips">6-16位英文（区分大小写）、数字或常用字符</span>
                </div>
                <div class="number">
                    <span class="pre">确认密码</span>
                    <input type="password" class="numIpt" name="rePassword" id="rePassword">
                    <span class="tips">请保证两次输入一致</span>
                </div>
				<div class="number">
					<p id="tip" style="color:red" class="col-sm-offset-4">${sessionScope.tip}<%session.setAttribute("tip", "");%></p>
				</div>
				<div class="selectDiv">
                   <input type="checkbox" checked class="checkboxInput">同意协议
                </div>

                <button type="submit" class="btn btn-primary">立即注册</button>
            </div>
            </form>
        </div>

        <div class="footer">
            <span class="leftSpan">Copyright @ 2017 yiqibang.com Inc. All Rights Reserved.宜企邦公司 版权所有</span>
            <div class="rightNav">
                <ul>
                    <li><a href="">帮助</a></li>
                    <li>|</li>
                    <li><a href="">首页</a></li>
                    <li>|</li>
                    <li><a href="">关于我们</a></li>

                </ul>
            </div>
        </div>
    </div>
</body>
</html>