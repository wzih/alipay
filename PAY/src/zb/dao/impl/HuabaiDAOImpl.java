package zb.dao.impl;

import java.sql.SQLException;
import java.util.Map;

import zb.dao.BaseDAO;
import zb.dao.HuabaiDAO;
import zb.po.Huabai;
import zb.po.User;

public class HuabaiDAOImpl extends BaseDAO implements HuabaiDAO {

	public Huabai getOneInfo(int userid) {
		String sql = "SELECT * FROM HUABAI WHERE USERID = ?";
		Huabai huabai = null;
		rs = executeQuery(sql, userid);
		try {
			if (rs.next()){
				huabai = new Huabai(rs.getInt("id"), new User(rs.getInt("userid")), rs.getInt("totalamount"), rs.getInt("availableamount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return huabai;
	}

	public int updateInfo(Map<String, Object> info) {
		int availableamount = Integer.valueOf(info.get("age").toString());
		int userid = Integer.valueOf(info.get("userid").toString());
		String sql = "UPDATE HUABAI SET AVAILABLEAMOUNT = ? WHERE USERID = ?";
		return executeUpdate(sql, availableamount,userid);
	}

	public int addInfo(int userid) {
		String sql = "INSERT INTO HUABAI(USERID) VALUES(?)";
		return executeUpdate(sql, userid);
	}

}
