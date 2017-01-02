package htSys.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class JdbcUtil {
	
	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String url="jdbc:mysql://localhost:3306/htsys?useUnicode=true&characterEncoding=UTF-8";
	private static final String username="root";
	private static final String password="";
	
	private static Connection conn = null;
	
	static {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws Exception {
		
		if(conn==null) {
			conn = DriverManager.getConnection(url, username, password);
			return conn;
		}
		return conn;
	}
	
	//测试conn数据库链接
	public static void main(String[] args) {
		
		try{
		   Connection conn = JdbcUtil.getConnection();
		   if(conn!=null) {
			   System.out.println(conn);
		   }else {
			   System.out.println("数据库链接失败！");
		   }
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
