package zb.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.omg.CORBA.FREE_MEM;

import zb.dao.BaseDAO;
import zb.dao.FriendsDAO;
import zb.po.Friends;
import zb.po.User;

public class FriendsDAOImpl extends BaseDAO implements FriendsDAO {

	public List<Friends> getAllFriens(int userid) {
		String sql = "SELECT U2.USERNAME FNAME,U2.TEL FTEL,U2.ID FID FROM FRIENDS INNER JOIN USER U1 ON U1.ID = USERID INNER JOIN USER U2 ON U2.ID = FRIENDSID WHERE USERID = ?";
		List<Friends> friends = new ArrayList<Friends>();
		rs = executeQuery(sql, userid);
		try {
			while(rs.next()){
				friends.add(new Friends(0, null, new User(rs.getInt("fid"),rs.getString("fname"),rs.getString("ftel"))));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return friends;
	}

}
