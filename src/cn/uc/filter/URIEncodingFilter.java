package cn.uc.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.uc.model.TAdmin;

@WebFilter("/*")
public class URIEncodingFilter implements Filter {

   
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//设置编码格式
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");	
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		String url = httpRequest.getServletPath();
		//System.out.println(url);
		String contextPath = httpRequest.getContextPath();
		if (url.startsWith("/yiQiBangWeb/admin")){
			if(url.endsWith("login.jsp") || url.endsWith("validate.jsp")) {
				chain.doFilter(request, response);
				return;
			}
		//进行过滤
		TAdmin admin = (TAdmin) session.getAttribute("admin");
		//System.out.println(username);
		if (admin == null){
			httpResponse.sendRedirect(contextPath + "/yiQiBangWeb/admin/login.jsp");
			return;
			}
		}
		chain.doFilter(request, response);
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
