package zb.dao.impl;

import java.sql.SQLException;

import zb.dao.BaseDAO;
import zb.dao.TaobaoDAO;
import zb.po.Taobao;
import zb.po.User;

public class TaobaoDAOImpl extends BaseDAO implements TaobaoDAO {

	public int addInfo(int userid, int taobaoid) {
		String sql = "INSERT INTO TAOBAO(USERID,TAOBAOID) VALUES(?,?)";
		
		return executeUpdate(sql, userid,taobaoid);
	}

	public int delInfo(int id) {
		String sql = "DELETE FROM TAOBAO WHERE ID = ?";
		return executeUpdate(sql, id);
	}

	public Taobao getOneInfo(int userid) {
		String sql = "SELECT * FROM TAOBAO WHERE USERID = ?";
		Taobao taobao = null;
		rs = executeQuery(sql, userid);
		try {
			if(rs.next()){
				taobao = new Taobao(rs.getInt("id"), new User(rs.getInt("userid")), rs.getInt("taobaoid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeAll();
		}
		return taobao;
	}

}
