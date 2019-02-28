package zb.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import zb.dao.BaseDAO;
import zb.dao.VIPLevelDAO;
import zb.po.VIPLevel;

public class VIPLevelDAOImpl extends BaseDAO implements VIPLevelDAO {

	public List<VIPLevel> getAllLevel() {
		List<VIPLevel> vipLevels = new ArrayList<VIPLevel>();
		String sql = "SELECT * FROM VIPLEVEL";
		rs = executeQuery(sql);
		try {
			while(rs.next()){
				vipLevels.add(new VIPLevel(rs.getInt("id"), rs.getString("name")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return vipLevels;
	}

}
