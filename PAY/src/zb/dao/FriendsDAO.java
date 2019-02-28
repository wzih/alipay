package zb.dao;

import java.util.List;

import zb.po.Friends;

public interface FriendsDAO {
	List<Friends> getAllFriens(int userid); //根据用户id获取用户好友列表
}
