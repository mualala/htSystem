package htSys.controller.user;

import htSys.dao.UserDao;
import htSys.entity.User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//用户登录验证
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String uCheckcode = req.getParameter("checkcode");
		
		UserDao userDao = new UserDao();
		User user = userDao.checkLogin(username, password);
		
		//用于重定向地址
		String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/";
		//获取Kaptcha验证码组件中的验证码值
		String checkcode = (String)req.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		
		System.out.println("-------------------------------");
		System.out.println("用户输入的验证码： "+uCheckcode+"\nKaptcha组件生成的验证码： "+checkcode+"\n是否一致： "+(uCheckcode==checkcode));
		System.out.println("-------------------------------");
		
		if(user==null){//验证用户名和密码
			req.setAttribute("loginError", "The UserName or Password is empty or error!");
			req.getRequestDispatcher("jsp/reLog.jsp").forward(req, resp);
		}else if ("".equals(uCheckcode) || !checkcode.equalsIgnoreCase(uCheckcode)) {//验证验证码
			req.setAttribute("loginError", "The CheckCode is empty or error!");
			req.getRequestDispatcher("jsp/reLog.jsp").forward(req, resp);
		}else {
			//重定向到后台首页
			req.getSession().setAttribute("username", username);
			resp.sendRedirect(basePath + "jsp/index03.HTML");
		}
		
	}
	
	
}
