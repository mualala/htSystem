package htSys.dao;

import htSys.util.JdbcUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.Blob;

public class PicDao {
	
	//上传图片
	public void picOneUpload(int uid, String pName,FileInputStream fis, int picSize){
		
		Connection conn = null;
		PreparedStatement ps = null;
//		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "insert into pic_table (u_id,p_name,pic,up_date) values (?,?,?,?)";
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String nowDate = sdf.format(date);
			Timestamp nowTime = Timestamp.valueOf(nowDate);
			
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, uid);
			ps.setString(2, pName);
			ps.setBinaryStream(3,fis, picSize);
			ps.setTimestamp(4, nowTime);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
          if (ps != null) {
				try {
					ps.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//查询pic_table表中图片的总记录数
	public int totalPic(){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "select count(1) from pic_table";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			int count = 0;
			while(rs.next()){
				count = rs.getInt(1);
			}
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally{
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

	//从数据库读取图片存到服务器本地，并且获取当前的图片名的集合
	public ArrayList<String> loadPicToLocal(String path, int randomStart){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ArrayList<String> picNameList = new ArrayList<>();
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "select p_id,p_name,pic from pic_table limit ?,8";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, randomStart);
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				//将图片名字拼称图片名+"-"+pid
				String pName01 = rs.getString("p_name");
				String pName02 = pName01.replaceAll("\\.", "-");
				int end = pName02.lastIndexOf("-");
				int pid = rs.getInt("p_id");
				String pName = pName01.substring(0, end)+"-"+pid+pName01.substring(end, pName01.length());
				
				Blob pic = (Blob) rs.getBlob("pic");
				
				picNameList.add(pName);
				
				//服务器本地的保存路径+文件名
				String localPath = path + pName;
				File file = new File(localPath);
				
				OutputStream os = new FileOutputStream(file);
				
				os.write(pic.getBytes(1, (int) pic.length()));//存到服务器本地				
			}
			return picNameList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
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

	//从数据库删除pid的图片
	public void deleteOnePic(int pid){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "delete from pic_table where p_id=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pid);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
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
	
	
	
	
	
}
