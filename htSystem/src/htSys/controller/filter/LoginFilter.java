package htSys.controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//登录请求过滤
public class LoginFilter implements Filter {
	
	private FilterConfig config;
	
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)arg0;
		HttpServletResponse resp = (HttpServletResponse)arg1;
		HttpSession session = req.getSession();
		
		String noFilter = config.getInitParameter("noFilter");
		
		//处理过滤器的初始化参数配置的请求，让其全部通过
		if(noFilter!=null){
			String[] strArray = noFilter.split(";");
			for (int i = 0; i < strArray.length; i++) {
				
				if(strArray[i]==null || "".equals(strArray[i])) continue;
				
				if(req.getRequestURI().indexOf(strArray[i])!=-1){
					chain.doFilter(arg0, arg1);
					return;
				}
			}
		}
		
		//如果session中没有取到用户登录的账户名，重定向到登录页面
		if(session.getAttribute("username")!=null){
			chain.doFilter(arg0, arg1);
		}else {
			//用于重定向地址
			String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/";
			resp.sendRedirect(basePath+"login.jsp");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		config = arg0;
	}

}
