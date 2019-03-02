package zb.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




public class BaseDAO {
	private final static String DRIVER = "com.mysql.jdbc.Driver";//驱动类
	private final static String URL = "jdbc:mysql://hantianyi.mysql.rds.aliyuncs.com:3306/pay";//url
	private final static String USERNAME = "root";//用户名
	private final static String PASSWORD = "HanTianYi666";//密码
	
	protected Connection conn;   //连接对象
	protected PreparedStatement pstmt;    //执行sql的对象
	protected ResultSet rs;      //结果集
	
	
	static{
		try {
			Class.forName(DRIVER);   //步骤1：加载驱动
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//步骤2：获取连接
	public void getConnection(){
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//步骤5：关闭所有资源
	public void closeAll(){
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(pstmt != null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public int executeUpdate(String sql,Object...params){
		int count = 0;
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			if(params != null){
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i+1, params[i]);
				}
				
			}
			System.out.println(sql);
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return count;
	}
	public ResultSet executeQuery(String sql,Object...params){
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			if(params != null){
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i+1, params[i]);
				}
			}
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return rs;
	}
	
	
	
}
