package zb.dao;

import java.util.List;
import java.util.Map;

import zb.po.User;

public interface UserDAO {
	User getOneInfo(String username); //�����û�����ȡ�û���Ϣ�����ڵ�¼
	
	User getInfo(Map<String, Object>info);//�����ֻ���
	
	int addUser(Map<String, Object>info);//����һ���û�
	
	int updateUser(Map<String, Object>info);//������Ϣ
	
	int updateLastDate(Map<String, Object>info); //���µ�¼ʱ��
	
	int huafei(int id,int money);
}
