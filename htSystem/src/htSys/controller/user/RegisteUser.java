package htSys.controller.user;

import htSys.dao.UserDao;
import htSys.entity.User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//用户注册
public class RegisteUser extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		UserDao userDao = new UserDao();
		
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		resp.setContentType("application/json;charset=utf-8");
		
		String regUsername = req.getParameter("regUsername");//注册用户的用户名
		//如果查询出用户名，通过json传给页面提示：用户名已被注册了！
		if(!(null==userDao.checkUserName(regUsername))){
			out.write("{\"regError\":\"is Logined!\"}");
			out.close();
		}
		
		String regPassword = req.getParameter("regPassword");//注册用户的登录密码
		String regEmail = req.getParameter("regEmail");//注册用户的邮箱地址
		String regSex = req.getParameter("regSex");//注册用户的性别
		int regAge = 0;//注册用户的年龄
		//如果用户名没有被注册，且输入框都已经填入数据，则跳转页面到登录页
		if((!(null==regPassword || null==regEmail || null==regSex || null==req.getParameter("regAge")))&&null==userDao.checkUserName(regUsername)){
			if(!(null==req.getParameter("regAge"))){
				regAge = Integer.parseInt(req.getParameter("regAge"));
			}
			userDao.regUser(regUsername, regPassword, regEmail, regSex, regAge);
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
		}else {
			//否则通过json传给页面提示请重新注册
			out.write("{\"titleErro\":\"please Re login!\"}");
			out.close();
		}
		
		
	}
	
}
