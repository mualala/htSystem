package htSys.controller.picture;

import htSys.dao.PicDao;
import htSys.dao.UserDao;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class UploadPicture extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		PicDao picDao = new PicDao();
		UserDao userDao = new UserDao();
		
		SmartUpload su = new SmartUpload();
		
		su.initialize(this.getServletConfig(), req, resp);
		su.setMaxFileSize(1024*1024*500);
		su.setAllowedFilesList("jpg,gif,png");
		
		try {
			su.upload();
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		
		try{
			int count = su.getFiles().getCount();
			
			for(int i=0;i<count;i++){
				com.jspsmart.upload.File myFile = su.getFiles().getFile(i);
								
				String pName = myFile.getFileName();//获取上传的本地文件名
				String fileName = myFile.getFieldName();//获取表单中的属性值
				int picSize = myFile.getSize();//获取当前上传图片的大小
				
				if(!"".equals(pName)){//如果上传文件不为空
					String path = this.getServletContext().getRealPath("/");
					path = path +fileName;//生成上传文件的环境路径和文件名
					
					myFile.saveAs(path, su.SAVE_PHYSICAL);//生成SmartUpload的File对象
					
					java.io.File file = new java.io.File(path);
					FileInputStream fis = new FileInputStream(file);//生成上传文件的流对象
					
					String username = (String) req.getSession().getAttribute("username");
					int uid = userDao.checkUidByName(username);
					
					picDao.picOneUpload(uid, pName, fis, picSize);
					
					fis.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//用于重定向地址
		String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/";
//		resp.sendRedirect(basePath+"jsp/index.jsp");
		req.getRequestDispatcher("/jsp/index.jsp").forward(req, resp);
		
		for(int i=0;i<su.getFiles().getCount();i++){
			com.jspsmart.upload.File temFile = su.getFiles().getFile(i);
			
			System.out.println("-------------");
			System.out.println("表单file域中name属性的值："+temFile.getFieldName());
			System.out.println("上传的文件名："+temFile.getFileName());
			System.out.println("上传文件的大小："+temFile.getSize()/1024+" KB");
			System.out.println("上传文件的扩展名："+temFile.getFileExt());
			System.out.println("上传文件的全名："+temFile.getFilePathName());
			System.out.println("-------------");
		}
		
	}
	
}
