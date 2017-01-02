package htSys.dao;

import htSys.entity.JsonUser;
import htSys.entity.User;
import htSys.util.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

public class UserDao {
	
	//用户登录查询的dao
	public User checkLogin(String username, String password){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		User user = new User();
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "select u_name,u_pwd from htSys_user where u_name=? and u_pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if(rs.next()){
				user.setUname(rs.getString("u_name"));
				user.setPassword(rs.getString("u_pwd"));
				return user;
			}else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally{
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//检查用户名是否注册过的dao
	public User checkUserName(String username){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		User user = new User();
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "select u_name,u_pwd from htSys_user where u_name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if(rs.next()){
				user.setUname(rs.getString("u_name"));
				return user;
			}else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally{
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//用户注册更新表记录的dao
	public void regUser(String regUsername, String regPassword, String regEmail, String regSex, int regAge){
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "insert into htSys_user (`u_name`,`u_pwd`,`u_email`,`u_sex`,`u_age`,`u_creat_time`,`u_update_time`) values (?,?,?,?,?,?,?)";
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String nowDate = sdf.format(date);
			Timestamp nowTime = Timestamp.valueOf(nowDate);
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, regUsername);
			ps.setString(2, regPassword);
			ps.setString(3, regEmail);
			ps.setString(4, regSex);
			ps.setInt(5, regAge);
			ps.setTimestamp(6, nowTime);
			ps.setTimestamp(7, nowTime);
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//用户报表查询的dao
	public ArrayList<JsonUser> queryUser(){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "select * from htSys_user";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			ArrayList<JsonUser> userLists = new ArrayList<>();
			while(rs.next()){
				JsonUser jsonUser = new JsonUser();
				
				jsonUser.setUid(rs.getInt("u_id"));
				jsonUser.setUname(rs.getString("u_name"));
				jsonUser.setPassword(rs.getString("u_pwd"));
				jsonUser.setEmail(rs.getString("u_email"));
				jsonUser.setSex(rs.getString("u_sex"));
				jsonUser.setAge(rs.getInt("u_age"));
				jsonUser.setCreateTime(rs.getTimestamp("u_creat_time").toString());
				jsonUser.setUpdateTime(rs.getTimestamp("u_update_time").toString());
				
				userLists.add(jsonUser);
			}
			return userLists;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally{
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		
	}
	
	//用户报表分页查询
	public ArrayList<JsonUser> queryUserByPagination(int pageSize, int pageNumber){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "select * from htSys_user limit ?,?";
			
			ps = conn.prepareStatement(sql);
			
			int start = (pageNumber-1)*pageSize;//当前页数的起始位置
			int end = pageSize;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			rs = ps.executeQuery();
			
			ArrayList<JsonUser> userLists = new ArrayList<>();
			while(rs.next()){
				JsonUser jsonUser = new JsonUser();
				
				jsonUser.setUid(rs.getInt("u_id"));
				jsonUser.setUname(rs.getString("u_name"));
				jsonUser.setPassword(rs.getString("u_pwd"));
				jsonUser.setEmail(rs.getString("u_email"));
				jsonUser.setSex(rs.getString("u_sex"));
				jsonUser.setAge(rs.getInt("u_age"));
				jsonUser.setCreateTime(rs.getTimestamp("u_creat_time").toString());
				jsonUser.setUpdateTime(rs.getTimestamp("u_update_time").toString());
				
				userLists.add(jsonUser);
			}
			return userLists;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally{
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//用户报表分页查询，查询User表的总记录数
	public int queryUserTotal(){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "SELECT COUNT(1) FROM htsys_user";
			
			ps = conn.prepareStatement(sql);
			
			int count = 0;
			
			rs = ps.executeQuery();
			while(rs.next()){
				count = rs.getInt(1);
			}
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally{
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//用户删除多条记录
	public int deletUser(ArrayList<Integer> deleteId){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getConnection();
			
			StringBuffer sqlB = new StringBuffer("delete from htSys_user where u_id in (");
			for(int i=0;i<deleteId.size();i++){
				if(i==0){
					sqlB.append("?");
				}else {
					sqlB.append(",?");
				}
			}
			sqlB.append(")");
			String sql = sqlB.toString();
			
			ps = conn.prepareStatement(sql);
			
			for(int i=0;i<deleteId.size();i++){
				ps.setInt(i+1, deleteId.get(i));
			}
			
			int aa = ps.executeUpdate();
			
			return aa;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally{
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//用户删一条条记录
	public int deletOneUser(int deleteId){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "delete from htSys_user where u_id in (?)";
			
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, deleteId);
			
			int aa = ps.executeUpdate();
			
			return aa;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally{
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//更新用户(user报表的edit按钮)
	public void editUser(String updateUsername, String updatePassword, String updateEmail, String updateSex, int updateAge, int uid){
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "update htSys_user set u_name=?,u_pwd=?,u_email=?,u_sex=?,u_age=?,u_update_time=? where u_id=?";
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String nowDate = sdf.format(date);
			Timestamp nowTime = Timestamp.valueOf(nowDate);
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, updateUsername);
			ps.setString(2, updatePassword);
			ps.setString(3, updateEmail);
			ps.setString(4, updateSex);
			ps.setInt(5, updateAge);
			ps.setTimestamp(6, nowTime);
			ps.setInt(7, uid);
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//根据用户名查询用户id
	public int checkUidByName(String username){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int uid = 0;
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "select u_id from htSys_user where u_name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			
			if(rs.next()){
				return uid = rs.getInt("u_id");
			}else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally{
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	
	public static void main(String[] args) {
		//测试dao
		UserDao userDao = new UserDao();
		
//		ArrayList<JsonUser> jsonUsers = userDao.queryUser();
//		for (JsonUser jsonUser : jsonUsers) {
//			System.out.println(jsonUser.getUpdateTime());
//		}
		
		
	}
	
}
