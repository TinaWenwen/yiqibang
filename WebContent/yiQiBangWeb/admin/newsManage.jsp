
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.Admin,java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻管理</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/BackendCss/backend.css">
    <script src="../jquery/jquery-3.2.1.min.js"></script>
    <script src="../bootstrap/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="my_container">
        <%@ include file="header.jsp" %>

        <div class="context">
            <%@ include file="menu.jsp" %>

            <div class="main">
                <div class="tableTop">
                    <div class="searchUser">
                        <input type="text" placeholder="输入搜索内容">
                        <img src="../html/backendImg/public/fangdajing.png">
                    </div>
                    <div class="addDiv">
                        <span class="glyphicon glyphicon-plus"></span>
                        添加
                    </div>
                </div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active">
                        <table class="table table-bordered">
                            <thead>
                            <th>序号</th>
                            <th>标题</th>
                            <th>来源</th>
                            <th>分类</th>
                            <th>浏览数量</th>
                            <th>评论数量</th>
                            <th>图片1</th>
                            <th>图片2</th>
                            <th>图片3</th>
                            <th>作者</th>
                            <th>创建时间</th>
                            <th>分享数量</th>
                            <th>内容</th>
                            <th>热推</th>
                            <th>举报</th>
                            <th>操作</th>
                            </thead>
                            <tbody>
                             
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td><a href=""><img src="../html/backendImg/public/xiugai.png"></a>
                                <a href=""><img src="../html/backendImg/public/shanchu.png"></a></td>
                            </tr>
                            
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
$(function(){
	$('.leftContext li:eq(1)').addClass('active');
});
</script>
</body>
</html>