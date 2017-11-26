<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="cn.uc.model.TType,
    cn.uc.model.TNews,
    cn.uc.model.TUser,
    java.util.*,
    cn.uc.dao.TTypeMapper,
    cn.uc.dao.TNewsMapper,
    cn.uc.dao.impl.TTypeMapperImpl,
    cn.uc.dao.impl.TNewsMapperImpl,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr,
    javax.servlet.http.HttpSession,
    javax.servlet.http.HttpServletRequest,
    javax.servlet.http.HttpServletResponse"%>
    
<%
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
    <title>个人设置</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/headSet.css">
    <script src="../jquery/jquery-3.2.1.min.js"></script>
	<script src="../bootstrap/bootstrap/dist/js/bootstrap.min.js"></script>
    <script>
   $(function(){
		
	   //使用FormData对象
	   $("#uploadBtn").click(function(){
		   var result = checkImg();
		   if(result){
			   //表单数据
			  var formData = new FormData();
			  formData.append("userfile", document.getElementById('headImg').files[0]);
			  $.ajax({
				  url : "/yiQiBang/UserServlet?action=addUserPhoto",
				  type : "post",
				  data : formData,
				  processData : false,
				  contentType : false,
				  success : function(data){
					  console.log(data);
					  //将json字符串转化为js的对象
					 var result = JSON.parse(data);
					  if(result.retMsg){
						  $(".myhead").attr("src","/yiQiBang/headImg/"+result.imgName);
						  var imgName = result.imgName;
						  $('#headUrl').val(imgName);
						  $('form').submit();
					  }else{
						  alert("上传失败");
					  }
					 
				  },
				  error:function(e){
					  console.log(data);
				  }
			  });
		   }
	   });
   });
   
   function checkImg() {
		if ($("#headImg").val() == "") {//文件选择器没有选择文件
			alert("请选择文件");
			return false;
		} else {
			return true;
		}

	}
</script>
</head>
<body>
    <header>
        <ul class="list-inline">
            <li><a style="color:white;" href="userCenter.jsp">个人中心</a></li>
        </ul>

        <div class="rightHeader">
            <img src="/yiQiBang/headImg/<%=imgName %>" style="width:25px;height:25px;">
            <span style="color:white;line-height:30px;"><%=userName %></span>
            <a style="color:white;" href="newsSearch.jsp">返回</a>
        </div>
    </header>

    <div class="main">
        <div class="top">
           <img src="/yiQiBang/headImg/<%=imgName %>" style="width:48px;height:48px;">
            <div class="useData">
            	<%=userName %>
                <br>活跃天数：324天
            </div>
        </div>

        <div class="settingLists">
            <ul class="setList list-inline">
                <li><a href="">修改头像</a></li>
            </ul>
        </div>

        <div class="setHeadTitle">
            <h5>设置一个您喜欢的头像：</h5>
            <h6>(请选择图片文件，最佳尺寸400x400,支持JPG,JPEG,GIF,PNG)</h6>
        </div>

        <div class="headImg">
            <div class="photo"><img class="myhead" src="/yiQiBang/headImg/<%=imgName %>" style="width:198px;height:198px;"></div>
            <img src="../html/frontImg/fengexian.png">
            <div class="review">
                <h5>头像预览</h5>
                <img class="myhead" src="/yiQiBang/headImg/<%=imgName %>" style="width:115px;height:115px;">
            </div>
        </div>
        <form action="<%=request.getContextPath() %>/UserServlet?action=changeUserPhoto" method=post>
        <input type="file" id="headImg" style="margin-left:100px;">
		<input type="hidden" name="headUrl" id="headUrl">
		<button type="button" class="btn btn-primary" id="uploadBtn" style="margin-top: 10px;">上传头像</button>
		</form>
    </div>
</body>
</html>