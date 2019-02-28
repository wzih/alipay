package zb.service;

import java.util.Map;

import zb.dao.impl.UserDAOImpl;
import zb.po.User;

public class UserService {
	private UserDAOImpl userDAOImpl;
	
	public UserService() {
		userDAOImpl = new UserDAOImpl();
	}
	//��¼��֤
	public User login(String tel,String loginPWD){
		User user = userDAOImpl.getOneInfo(tel);
		
		if (user==null) {
			throw new RuntimeException("�û������ڣ�");
		}
		if (!user.getLoginPWD().equals(loginPWD)) {
			throw new RuntimeException("�������");
		}
		return user;
	}
	
	public User getOneInfo(String username) {
		return userDAOImpl.getOneInfo(username);
	}
	
	public User getInfo(Map<String, Object> info) {
		return userDAOImpl.getInfo(info);
	}
	
	//�����û�
	public int addUser(Map<String, Object> info) {
		return userDAOImpl.addUser(info);
	}
	
	public int updateUser(Map<String, Object> info) {
		return userDAOImpl.updateUser(info);
	}
	
	public int updateLastDate(Map<String, Object> info) {
		return userDAOImpl.updateLastDate(info);
	}
}
