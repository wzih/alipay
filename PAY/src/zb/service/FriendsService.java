package zb.service;

import java.util.List;

import zb.dao.impl.FriendsDAOImpl;
import zb.po.Friends;

public class FriendsService {
	private FriendsDAOImpl friendsDAOImpl;
	public FriendsService() {
		friendsDAOImpl = new FriendsDAOImpl();
	}
	
	public List<Friends> getAllFriens(int userid) {
		return friendsDAOImpl.getAllFriens(userid);
	}
}
