<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人设置</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/headSet.css">
</head>
<body>
    <header>
        <ul class="list-inline">
            <li>推荐</li>
            <li>热点</li>
            <li>图片</li>
            <li>科技</li>
            <li>社会</li>
            <li>娱乐</li>
            <li>体育</li>
            <li>游戏</li>
            <li>汽车</li>
            <li>财经</li>
            <li>更多</li>
        </ul>

        <div class="rightHeader">
            <img src="frontImg/xiaotouxiang.png">瑞雯雯
            <span>退出</span>
        </div>
    </header>

    <div class="main">
        <div class="top">
            <img src="frontImg/datouxiang.png">
            <div class="useData">
                瑞雯雯<br>活跃天数：324天
            </div>
        </div>

        <div class="settingLists">
            <ul class="setList list-inline">
                <li>个人资料</li>
                <li><a href="">修改头像</a></li>
                <li>修改密码</li>
                <li>账号安全</li>
            </ul>
        </div>

        <div class="setHeadTitle">
            <h5>设置一个您喜欢的头像：</h5>
            <h6>(请选择图片文件，最佳尺寸400x400,支持JPG,JPEG,GIF,PNG)</h6>
        </div>

        <div class="headImg">
            <div class="photo"><img src="frontImg/xuanzetouxiang.png"></div>
            <img src="frontImg/fengexian.png">
            <div class="review">
                <h5>头像预览</h5>
                <img src="frontImg/touxiangyulan.png">
            </div>
        </div>
        <button class="btn">选择头像</button>
    </div>
</body>
</html>