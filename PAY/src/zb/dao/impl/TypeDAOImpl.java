package zb.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import zb.dao.BaseDAO;
import zb.dao.TypeDAO;
import zb.po.Type;

public class TypeDAOImpl extends BaseDAO implements TypeDAO {

	public List<Type> getAllType() {
		String sql = "SELECT * FROM TYPE";
		rs = executeQuery(sql);
		List<Type> types = new ArrayList<Type>();
		try {
			while(rs.next()){
				types.add(new Type(rs.getInt("id"), rs.getString("name")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return types;
	}
	
}
