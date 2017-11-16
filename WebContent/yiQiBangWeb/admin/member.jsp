<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TUser,
    java.util.*,
    cn.uc.dao.*,
    cn.uc.dao.impl.*,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr,
    cn.uc.util.Constants"%>
    
 <%!
	List<TUser> data;
 	Result result = new Result();
 	Result countsResult = new Result();
 	TUserMapper userDao = new TUserMapperImpl();
 	AreasMapper areaDao = new AreasMapperImpl();
 	CitiesMapper cityDao = new CitiesMapperImpl();
 	ProvincesMapper provinceDao = new ProvincesMapperImpl();
 	
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
		
		countsResult = userDao.selectAllCounts(searchStr);
		int counts = (int)countsResult.getRetData();
		maxPage = (int)Math.ceil((float)counts / Constants.PAGE_SIZE);
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
 	
 	result = userDao.selectUserByLike(searchStr, pageParam);
 	data = (List<TUser>)result.getRetData();
 	
 %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>会员管理</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/BackendCss/backend.css">
    <script src="../jquery/jquery-3.2.1.min.js"></script>
    <script src="../bootstrap/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../bootstrap/bootstrap/js/bootstrap-paginator.min.js"></script>
</head>
<body>
    <div class="my_container">
        <%@ include file="header.jsp" %>

        <div class="context">
            <%@ include file="menu.jsp"  %>

            <div class="main">
                <div class="tableTop">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="active"><a href="#">会员</a></li>
                        <li><a href="<%=request.getContextPath()%>/yiQiBangWeb/admin/admin.jsp">管理员</a></li>
                    </ul>
                    <form method="get">
                    <div class="searchUser">
                        <input type="text" placeholder="昵称/用户名/手机" name="searchStr">
                        <img src="../html/backendImg/public/fangdajing.png" id="selectImg">
                    </div>
                    </form>
                    <div class="addDiv">
                        <span class="glyphicon glyphicon-plus"></span>
                        添加
                    </div>
                </div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="client">
                        <table class="table table-bordered">
                            <thead>
                            <th>序号</th>
                            <th>用户名</th>
                            <th>昵称</th>
                            <th>性别</th>
                            <th>生日</th>
                            <th>地址</th>
                            <th>手机号</th>
                            <th>邮箱</th>
                            <th>状态</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                            <th>头像</th>
                            <th>备注</th>
                            <th>操作</th>
                            </thead>
                            <tbody>
                            <% for(int i = 0; i < data.size(); i++) {%>
                            <tr>
                                <td><%=i+1 %></td>
                                <td><%=data.get(i).getUsername() %></td>
                                <td><%=data.get(i).getNickname() %></td>
                                <td><%=data.get(i).getSex()?"男":"女" %></td>
                                <td><%=DateSimpleStr.getBirthDate(data.get(i).getBirthday())%></td>
                                <td><%=provinceDao.selectProvinceById("" + (data.get(i).getProvinceid()) + "").getRetData() %>/<%=cityDao.selectCityById(("" + data.get(i).getCityid() +"")).getRetData()%>/<%=areaDao.selectAreaByAreaId(("" + data.get(i).getAreaid() + "")).getRetData() %></td>
                                <td><%=data.get(i).getBindtel() %></td>
                                <td><%=data.get(i).getEmail() %></td>
                                <td><%=data.get(i).getState()?"禁用":"可用" %></td>
                                <td><%=DateSimpleStr.getStringDate(data.get(i).getCreatetime()) %></td>
                                <td><%=DateSimpleStr.getStringDate(data.get(i).getUpdate()) %></td>
                                <td><%=data.get(i).getHeadimg() %></td>
                                <td><%=data.get(i).getRemark() %></td>
                                <td>
                                <a href="userInsert.jsp"><img src="../html/backendImg/public/xiugai.png"></a>
                                <a href=""><img src="../html/backendImg/public/shanchu.png"></a>
                                </td>
                            </tr>
                          <% } %>
                            </tbody>
                        </table>
                        <ul id="myPagination"></ul>
                    </div>
                </div>

            </div>
        </div>
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
    			map[tmp[0]] = tmp[1] ? tmp[1] : '';
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
<script>
$(function(){
	$('.leftContext li:eq(0)').addClass('active');
});
</script>
</body>
</html>





