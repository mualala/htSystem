package htSys.controller.report;

import htSys.dao.UserDao;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserDelete extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UserDao userDao = new UserDao();
		
		if(!"".equals(req.getParameter("deleteParam"))){
			
			if(req.getParameter("deleteParam").indexOf("-")==-1){//即用户只删除一条数据
				userDao.deletOneUser(Integer.parseInt(req.getParameter("deleteParam")));
				
			}else {//用户想删除多条选择的数据
				String[] str = req.getParameter("deleteParam").split("-");//将请求参数的id序列拆分
				
				ArrayList<Integer> paramsId = new ArrayList<>();
				for(int i=0;i<str.length;i++){
					paramsId.add(Integer.parseInt(str[i]));
				}
				int count = userDao.deletUser(paramsId);
				System.out.println("删除了："+count+"条记录");
			}
			
		}
		
		
		
	}

}
