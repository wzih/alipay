package zb.dao.impl;

import java.sql.SQLException;

import zb.dao.BaseDAO;
import zb.dao.YuebaoDAO;
import zb.po.User;
import zb.po.Yuebao;

public class YuebaoDAOImpl extends BaseDAO implements YuebaoDAO {

	public int addInfo(int userid) {
		String sql = "INSERT INTO YUEBAO(USERID) VALUES(?)";
		return executeUpdate(sql, userid);
	}

	public Yuebao getOneInfo(int userid) {
		String sql = "SELECT * FROM YUEBAO WHERE USERID = ?";
		Yuebao yuebao = null;
		rs = executeQuery(sql, userid);
		try {
			while(rs.next()){
				yuebao  = new Yuebao(rs.getInt("id"), new User(rs.getInt("userid")), rs.getInt("balance"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeAll();
		}
		return yuebao;
	}

}
