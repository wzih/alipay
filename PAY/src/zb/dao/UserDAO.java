package zb.dao;

import java.util.List;
import java.util.Map;

import zb.po.User;

public interface UserDAO {
	User getOneInfo(String username); //根据用户名获取用户信息，用于登录
	
	User getInfo(Map<String, Object>info);//查找手机号
	
	int addUser(Map<String, Object>info);//新增一个用户
	
	int updateUser(Map<String, Object>info);//更改信息
	
	int updateLastDate(Map<String, Object>info); //更新登录时间
	
	int huafei(int id,int money);
}
