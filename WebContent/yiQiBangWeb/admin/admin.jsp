
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="cn.uc.model.TAdmin,
    java.util.*,
    cn.uc.dao.TAdminMapper,
    cn.uc.dao.impl.TAdminMapperImpl,
    cn.uc.util.Result,
    cn.uc.util.DateSimpleStr,
    cn.uc.util.Constants"%>

<%!
	List<TAdmin> data;
	Result result = new Result();
	Result countsResult = new Result();
	TAdminMapper adminDao = new TAdminMapperImpl();%>
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
	//获取当前查询的数据的最大页数
	countsResult = adminDao.selectAllCounts(searchStr);
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
	System.out.println("一共有" + maxPage + "页");
	System.out.println("当前页为" + pageParam); */
	//获取查询列表
	result = adminDao.selectAdminByLike(searchStr, pageParam);
	data = (List<TAdmin>) result.getRetData();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员管理</title>
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
            <%@ include file="menu.jsp" %>

            <div class="main">
                <div class="tableTop">
                    <ul class="nav nav-tabs">
                        <li><a href="<%=request.getContextPath()%>/yiQiBangWeb/admin/member.jsp">会员</a></li>
                        <li class="active"><a href="#">管理员</a></li>
                    </ul>
                    <form method="get">
                    <div class="searchUser">
                    	<input type="text" placeholder="用户名/级别" name="searchStr" value="<%=searchStr %>">
                        <a id="selectImg"><img src="../html/backendImg/public/fangdajing.png"></a>
                    </div>
                    </form>
                    
                    <div class="addDiv">
                        <a href="adminEdit.jsp"><span class="glyphicon glyphicon-plus"></span></a>
                        添加
                    </div>
                </div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active">
                        <table class="table table-bordered">
                            <thead>
                            <th>序号</th>
                            <th>级别</th>
                            <th>状态</th>
                            <th>用户名</th>
                            <th>添加时间</th>
                            <th>操作</th>
                            </thead>
                            <tbody>
                            <% for(int i = 0; i < data.size(); i++) {%>
                            <tr>
                                <td><%=i+1%></td>
                                <td><%=data.get(i).getLevel()%></td>
                                <td><%=data.get(i).getState()?"禁用":"可用"%></td>
                                <td><%=data.get(i).getUser().getUsername() %></td>
                                <td><%=DateSimpleStr.getStringDate(data.get(i).getUser().getCreatetime()) %></td>
                                <td><a href="adminEdit.jsp?id=<%=data.get(i).getId()%>"><img src="../html/backendImg/public/xiugai.png"></a>
                                <a class="deleteBtn" data-id="<%=data.get(i).getId()%>"><img src="../html/backendImg/public/shanchu.png"></a></td>
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
						url : "/yiQiBang/AdminServlet",
						data : {
							action : "adminDelete",
							id : id
						},
						dataType : "json",
						timeout : 5000,
						type : "post",
						success : function(data) {
							if (data.retCode == 0) {
								location.reload();
							}
							if (data.retCode == 2000) {
								alert("权限不足！");
							}
						},
						error : function(e) {
							alert("删除失败" + e);
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





