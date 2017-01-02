package htSys.controller.report;

import htSys.dao.UserDao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserEdit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UserDao userDao = new UserDao();
		
		req.setCharacterEncoding("utf-8");
		
		String updateUsername = req.getParameter("regUsername");
		String updatePassword = req.getParameter("regPassword");
		String updateEmail = req.getParameter("regEmail");
		String updateSex = req.getParameter("regSex");
		int updateAge = Integer.parseInt(req.getParameter("regAge"));
		int uid = Integer.parseInt(req.getParameter("userId"));
		
		userDao.editUser(updateUsername, updatePassword, updateEmail, updateSex, updateAge, uid);
		
	}
	
}
