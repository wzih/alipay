package zb.dao.impl;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import zb.dao.BaseDAO;
import zb.dao.UserDAO;
import zb.po.User;

public class UserDAOImpl extends BaseDAO implements UserDAO {
	
	public User getOneInfo(String tel) {
		String sql = "SELECT * FROM USER WHERE TEL = ?";
		rs = executeQuery(sql, tel);
		User user = null;
		try {
			if (rs.next()) {
				user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("loginPWD"), rs.getString("payPwd"), rs.getDate("registeRDate"), rs.getDate("lastLoginDate"), rs.getString("image"), rs.getInt("age"), rs.getString("name"), rs.getString("idCard"), rs.getString("tel"),rs.getInt("balance"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return user;
	}

	public int addUser(Map<String, Object> info) {
		String username = info.get("username").toString();      //用户名
		String loginPWD = info.get("loginPWD").toString();      //登录密码
		String payPWD = info.get("payPWD").toString();          //支付密码
		String image = info.get("image").toString();            //头像地址
		int age = Integer.valueOf(info.get("age").toString());  //用户年龄
		String name = info.get("name").toString();              //用户姓名
		String idCard = info.get("idCard").toString();          //身份证号
		String tel = info.get("tel").toString();                //电话号码
		Date registeRDate = new Date();                         //注册日期
		
		String sql = "INSERT INTO USER(USERNAME,LOGINPWD,PAYPWD,IMAGE,AGE,NAME,IDCARD,TEL,REGISTERDATE) VALUES(?,?,?,?,?,?,?,?,?)";
		return executeUpdate(sql, username,loginPWD,payPWD,image,age,name,idCard,tel,registeRDate);
	}

	public int updateUser(Map<String, Object> info) {
		String username = info.get("username").toString();      //用户名
		String loginPWD = info.get("loginPWD").toString();      //登录密码
		String payPWD = info.get("payPWD").toString();          //支付密码
		String image = info.get("image").toString();            //头像地址
		int age = Integer.valueOf(info.get("age").toString());  //用户年龄
		String tel = info.get("tel").toString();                //手机号码
		int userid = Integer.valueOf(info.get("userid").toString()); 
		int money = Integer.valueOf(info.get("money").toString());
		int friendsid = Integer.valueOf(info.get("friendsid").toString());
		int count = 0; 
		String inorout = info.get("inorout").toString();  
		String sql = "UPDATE USER";
		
		if (username!="") {
			sql += " SET USERNAME = ? WHERE ID = ?";
			count = executeUpdate(sql, username,userid);
		}
		if (loginPWD!="") {
			sql += " SET LOGINPWD = ? WHERE ID = ?";
			count = executeUpdate(sql, loginPWD,userid);
		}
		if (payPWD!="") {
			sql += " SET PAYPWD = ? WHERE ID = ?";
			count = executeUpdate(sql, payPWD,userid);
		}
		if (image!="") {
			sql += " SET IMAGE = ? WHERE ID = ?";
			count = executeUpdate(sql, image,userid);
		}
		if (age!=20) {
			sql += " SET AGE = ? WHERE ID = ?";
			count = executeUpdate(sql, age,userid);
		}
		if (tel!="") {
			sql += " SET TEL = ? WHERE ID = ?";
			count = executeUpdate(sql, tel,userid);
		}
		if (money!=0) {
			if (friendsid!=0) {
				sql += " SET BALANCE = BALANCE + ? WHERE ID = ?;";
				count = executeUpdate(sql, money,friendsid);
			} else if (inorout.equals("in")) {
				sql += " SET BALANCE = BALANCE + ? WHERE ID = ?;";
				count = executeUpdate(sql, money,userid);
			} else if (inorout.equals("out")) {
				sql += " SET BALANCE = BALANCE - ? WHERE ID = ?;";
				count = executeUpdate(sql, money,userid);
			}
		}
		return count;
	}

	

	public User getInfo(Map<String, Object> info) {
		String tel = info.get("tel").toString();
		
		String cardid = info.get("idCard").toString();
		String sql = "SELECT USERNAME,NAME,TEL FROM USER ";
		try {
			if(rs!=null){
				rs.close();
			}
		} catch (Exception e) {}
		if (tel!=""){
			sql+=" WHERE TEL = ?";
			rs = executeQuery(sql, tel);
		}else if(cardid!="") {
			sql+=" WHERE IDCARD = ?";
			rs = executeQuery(sql, cardid);
		}else{
			rs = executeQuery(sql);
		}
		User user = null;
		try {
			if(rs.next()) {
				user = new User(rs.getString("username"), rs.getString("name"), rs.getString("tel"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return user;
	}

	public int updateLastDate(Map<String, Object> info) {
		int userid = Integer.valueOf(info.get("userid").toString()); 
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String lastDate =Timestamp.valueOf(sf.format(info.get("lastLoginDate"))).toString();
		String sql = "UPDATE USER SET LASTLOGINDATE = ? WHERE ID = ?";
		return executeUpdate(sql,lastDate,userid);
	}

	public int huafei(int id, int money) {
		String sql = "UPDATE USER SET BALANCE = BALANCE - ? WHERE ID = ?;";
		
		return executeUpdate(sql, money,id);
	}

	
}
