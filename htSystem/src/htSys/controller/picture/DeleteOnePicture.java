package htSys.controller.picture;

import htSys.dao.PicDao;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteOnePicture extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		PicDao pidDao = new PicDao();
		
		int pid = Integer.parseInt(req.getParameter("pId"));
		
		pidDao.deleteOnePic(pid);//删除数据库中的图片
		
		System.out.println("删除的pid："+pid);
	}
	
}
