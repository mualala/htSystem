package htSys.controller.picture;

import htSys.dao.PicDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

public class LoadPicToLocal extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		resp.setContentType("application/json;charset=utf-8");
		
		//设置文件上传保存的路径
		String filePath = getServletContext().getRealPath("/")+"images/";
		
		PicDao picDao = new PicDao();
		
		int randomStart = 0;//初始化随机图片的id的起始位置
		if(picDao.totalPic()>16){//至少要有17张图片记录，因随机数最大可能取到8
			Random rand = new Random();
			randomStart = rand.nextInt(picDao.totalPic()-8);
		}
		
		ArrayList<String> picNames = picDao.loadPicToLocal(filePath, randomStart);//将图片存到本地，并获取图片名的集合
		
		JSONArray jsonArray = JSONArray.fromObject(picNames);
		out.write(jsonArray.toString());
		
		
		
	}
	
}
