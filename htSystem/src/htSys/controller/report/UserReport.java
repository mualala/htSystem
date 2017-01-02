package htSys.controller.report;

import htSys.entity.JsonUser;
import htSys.dao.UserDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

/**
 * 查询用户报表的请求
 * @author Administrator
 *
 */
public class UserReport extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		UserDao userDao = new UserDao();
		
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		resp.setContentType("application/json;charset=utf-8");
		
		int pageSize = Integer.parseInt(req.getParameter("pageSize"));//每页显示的记录数
		int pageNumber = Integer.parseInt(req.getParameter("pageNumber"));//第几页
		
		
		ArrayList<JsonUser> jsonUsers = userDao.queryUserByPagination(pageSize, pageNumber);
		
		JSONArray jsonArray = JSONArray.fromObject(jsonUsers);
		int total = userDao.queryUserTotal();
		
		String jsonStr = "{\"total\":"+total+",\"rows\":"+jsonArray.toString()+"}";//必须这样拼
		
		out.write(jsonStr);
		out.close();
		
	}
	
}
