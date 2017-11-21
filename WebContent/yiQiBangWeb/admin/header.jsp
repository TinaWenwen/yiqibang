<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" %>
    <header>
            <div class="userImg">
                <img src="../html/backendImg/public/touxiang.png">
                瑞雯雯
            </div>

            <div class="search">
                <input type="text" placeholder="请输入关键词">
                <img src="../html/backendImg/public/fangdajing.png">
            </div>

            <div class="rightDiv">
                <a href="<%=request.getContextPath() %>/AdminServlet?action=adminLogout"><span>注销</span></a>
                <img src="../html/backendImg/public/suoxiaochuankou.png">
                <img src="../html/backendImg/public/guanbi.png">
            </div>
        </header>