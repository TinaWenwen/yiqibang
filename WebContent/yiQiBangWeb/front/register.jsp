<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/sign.css">
    <style>
        .midDiv{
            margin-left: 40px;
        }

    </style>
</head>
<body>
    <header>
        <span>宜企邦首页</span>
        <a href="">登录通行证 > </a>
    </header>

    <div class="main">
        <img src="../html/frontImg/logo.png">
        <div class="contentDiv">
            <div class="topDiv">
                <div class="phone">
                    <img src="../html/frontImg/shoujiicon.png">账号注册
                </div>
                <div class="email">
                    <img src="../html/frontImg/mailicon.png">邮箱
                </div>
            </div>

            <div class="midDiv">
                <div class="number">
                    <span class="pre">用户名</span>
                    <input type="text" class="numIpt">
                    <span class="tips">注册成功后即可使用该用户名登陆</span>
                </div>
                <div class="number">
                    <span class="pre">设置密码</span>
                    <input type="text" class="numIpt">
                    <span class="tips">6-16位英文（区分代销写）、数字或常用字符</span>
                </div>
                <div class="number">
                    <span class="pre">确认密码</span>
                    <input type="text" class="numIpt1">
                    <span class="tips">免费获取手机验证码</span>
                </div>

                <div class="selectDiv">
                    <input type="checkbox" checked class="checkboxInput">同意协议
                </div>

                <button type="button" class="btn btn-primary">立即注册</button>
            </div>
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