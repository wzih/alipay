package zb.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import zb.dao.BaseDAO;
import zb.dao.StateDAO;
import zb.po.State;

public class StateDAOImpl extends BaseDAO implements StateDAO {

	public List<State> getAllState() {
		String sql = "SELECT * FROM STATE";
		rs = executeQuery(sql);
		List<State> States = new ArrayList<State>();
		try {
			while(rs.next()){
				States.add(new State(rs.getInt("id"), rs.getString("name")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return States;
	}
	
}
