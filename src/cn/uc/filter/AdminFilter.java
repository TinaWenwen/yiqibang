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

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter("/*")
public class AdminFilter implements Filter {

   
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		HttpSession session = httpRequest.getSession();
		/*Object obj = session.getAttribute("uid");
		if (obj == null) {
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/yiQiBangWeb/admin/login.jsp");
		}*/
		String url = httpRequest.getServletPath();
		if (url.equals("")){
		url += "/";
		}
		if ((url.startsWith("/") && url.startsWith("/yiQiBang/yiQiBangWeb/admin"))) {// 若访问后台资源
		// 设置不需要过滤的页面
		if (url.endsWith("about.jsp")) {
			chain.doFilter(request, response);
		return;
		}
		// 过滤到login
		Object obj = session.getAttribute("uid");
		if (obj == null) {// 转入管理员登陆页面
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/yiQiBangWeb/admin/login.jsp");
		return;
		}
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
