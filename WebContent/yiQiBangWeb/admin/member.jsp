<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TUser,
    java.util.*,
    cn.uc.dao.*,
    cn.uc.dao.impl.*,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr,
    cn.uc.util.Constants"%>

<%!List<TUser> data;
	Result result = new Result();
	Result countsResult = new Result();
	TUserMapper userDao = new TUserMapperImpl();
	AreasMapper areaDao = new AreasMapperImpl();
	CitiesMapper cityDao = new CitiesMapperImpl();
	ProvincesMapper provinceDao = new ProvincesMapperImpl();%>
<%
	//获取传来的查询条件
	String searchStr = request.getParameter("searchStr");
	//获取传来的页码参数
	String pageStr = request.getParameter("page");
	//当前显示的页码
	int pageParam;
	int maxPage;
	if (searchStr == null) {
		searchStr = "";
	}

	countsResult = userDao.selectAllCounts(searchStr);
	int counts = (int) countsResult.getRetData();
	maxPage = (int) Math.ceil((float) counts / Constants.PAGE_SIZE);
	try {
		pageParam = Integer.parseInt(pageStr);
		if (pageParam <= 0) {
			pageParam = 1;
		}
		if (pageParam > maxPage) {
			pageParam = maxPage;
		}
	} catch (NumberFormatException e) {
		pageParam = 1;
	}
	
	/* System.out.println("共有" + counts + "条数据");
	System.out.println("一共有" + maxPage + "页");*/
	/* System.out.println("当前页为" + pageParam);  */
	result = userDao.selectUserByLike(searchStr, pageParam);
	data = (List<TUser>) result.getRetData();
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
                        <input type="text" placeholder="昵称/用户名/手机" name="searchStr" value="<%=searchStr %>">
                        <a id="selectImg"><img src="../html/backendImg/public/fangdajing.png"></a>
                    </div>
                    </form>
                    <div class="addDiv">
                        <a href="userEdit.jsp"><span class="glyphicon glyphicon-plus"></span></a>
                        添加
                    </div>
                </div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="client">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
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
                            </tr>
                            </thead>
                            <tbody>
                            <% for(int i = 0; i < data.size(); i++) {%>
                            <tr>
                                <td><%=i+1 %></td>
                                <td><%=data.get(i).getUsername() %></td>
                                <td><%=data.get(i).getNickname() %></td>
                                <td><%=data.get(i).getSex()? "男" : "女" %></td>
                                <td><%=data.get(i).getBirthday()%></td>
                                <td><%=data.get(i).getAddress()%></td>
                                <td><%=data.get(i).getBindtel() %></td>
                                <td><%=data.get(i).getEmail() %></td>
                                <td><%=data.get(i).getState()? "禁用" : "可用" %></td>
                                <td><%=DateSimpleStr.getStringDate(data.get(i).getCreatetime()) %></td>
                                <td><%=DateSimpleStr.getStringDate(data.get(i).getUpdate()) %></td>
                                <td><img src="/yiQiBang/headImg/<%=data.get(i).getHeadimg() %>" style="max-height:40px;max-width:40px;"></td>
                                <td><%=data.get(i).getRemark() %></td>
                                <td>
                                <a href="userEdit.jsp?id=<%=data.get(i).getId()%>"><img src="../html/backendImg/public/xiugai.png"></a>
                                <a class="deleteBtn" data-id="<%=data.get(i).getId()%>"><img src="../html/backendImg/public/shanchu.png"></a>
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
</body>
<script>
	jQuery(document).ready(
			function() {
				//绑定条件查询事件
				jQuery('#selectImg').click(function(e) {
					jQuery('form').submit();
				});
				//删除绑定事件
				$('.deleteBtn').click(function(e) {
					if (!confirm('确认删除？')) {
						return false;
					}
					var id = $(this).data('id');
					$.ajax({
						url : "/yiQiBang/UserServlet",
						data : {
							action : "userDelete",
							id : id
						},
						dataType : "json",
						timeout : 5000,
						type : "post",
						success : function(data) {
							if (data.retCode == 0) {
								location.reload();
							}
						},
						error : function(e) {
							alert("删除失败,该用户是管理员！");
						}
					});
				});
				//获取当前页面GET参数
				var getParams = function(key) {
					var map = {};
					var arr = location.search.slice(1).split('&');
					for (var i = 0; i < arr.length; i++) {
						if (arr[i] == '')
							continue;
						var tmp = arr[i].split('=');
						map[tmp[0]] = tmp[1] ? decodeURIComponent(tmp[1]) : '';
					}

					if (key) {
						return map[key];
					} else {
						return map;
					}
				}

				var options = {
					bootstrapMajorVersion : 3,
					currentPage : <%=pageParam%>,
					totalPages : <%=Math.max(1, maxPage)%>,
					pageUrl : function(type, page, current) {
						var params = getParams();
						params['page'] = page;
						return location.origin + location.pathname + '?'
								+ $.param(params);
					}
				}

				$('#myPagination').bootstrapPaginator(options);
			});
</script>
<script>
	$(function() {
		$('.leftContext li:eq(0)').addClass('active');
	});
</script>
</html>





