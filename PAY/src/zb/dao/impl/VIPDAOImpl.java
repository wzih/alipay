package zb.dao.impl;

import java.sql.SQLException;

import zb.dao.BaseDAO;
import zb.dao.VIPDAO;
import zb.po.User;
import zb.po.VIP;
import zb.po.VIPLevel;

public class VIPDAOImpl extends BaseDAO implements VIPDAO {

	public VIP getOneInfo(int userid) {
		String sql = "SELECT V.ID VID,U.USERNAME,VL.NAME FROM VIP V INNER JOIN VIPLEVEL VL ON V.LEVELID = VL.ID INNER JOIN USER U ON V.USERID = U.ID WHERE USERID = ?";
		rs = executeQuery(sql, userid);
		VIP vip = null;
		try {
			while(rs.next()){
				vip = new VIP(rs.getInt("vid"), new User(rs.getString("username")), new VIPLevel( rs.getString("name")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return vip;
	}

	public int add(int userid) {
		String sql = "INSERT INTO VIP VALUES(NULL,?,?)";
		return executeUpdate(sql, userid,1);
	}

}
