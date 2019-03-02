package zb.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




public class BaseDAO {
	private final static String DRIVER = "com.mysql.jdbc.Driver";//������
	private final static String URL = "jdbc:mysql://hantianyi.mysql.rds.aliyuncs.com:3306/pay";//url
	private final static String USERNAME = "root";//�û���
	private final static String PASSWORD = "HanTianYi666";//����
	
	protected Connection conn;   //���Ӷ���
	protected PreparedStatement pstmt;    //ִ��sql�Ķ���
	protected ResultSet rs;      //�����
	
	
	static{
		try {
			Class.forName(DRIVER);   //����1����������
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//����2����ȡ����
	public void getConnection(){
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//����5���ر�������Դ
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
