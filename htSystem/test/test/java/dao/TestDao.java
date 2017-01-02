package test.java.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

import htSys.dao.PicDao;
import htSys.dao.UserDao;
import htSys.entity.User;

public class TestDao {
	
	
	//测试删除单张图片
	@Test
	public void deleteOnePic(){
		PicDao picDao = new PicDao();
		picDao.deleteOnePic(61);
	}
	
	//测用户登录查询
	@Test
	public void checkLogin(){
		UserDao userDao = new UserDao();
		User user = userDao.checkLogin("admin", "admin");
		System.out.println(user.getUname());
		System.out.println(user.getPassword());
	}
	
	//测用户更新edit
	@Test
	public void editUser(){
		UserDao userDao = new UserDao();

		userDao.editUser("yanghm03", "yanghm", "high@163.com", "1", 24, 106);
		
	}
	
	//册用户注册
	public void registeUser(){
//		UserDao userDao = new UserDao();
//		int i = userDao.regUser("a", "b", "cff@11.com", "nan", 12);
//		System.out.println(i);
	}
	
}
