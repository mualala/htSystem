package htSys.controller.picture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class DownOnePicture extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		String pName = req.getParameter("pName");
		
		SmartUpload su = new SmartUpload();
		su.initialize(getServletConfig(), req, resp);
		
		su.setContentDisposition(null);//如果是ie浏览器，则下载该文件而不是在网页打开文件
		
		try {
			su.downloadFile("/images/"+pName);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		
		
	}
	
}
