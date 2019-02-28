package zb.dao;

import java.util.List;
import java.util.Map;

import zb.po.Card;

public interface CardDAO {
	List<Card> getAllCardById(int userid);//�����û�ID�����а󶨵����п�
	
	int getCount(int userid);//�����û�ID��ȡ�û������п�����
	
	int addCard(Map<String, Object>info);//�������п�
	
	int delCard(Map<String, Object>info);//ɾ�����п�
}
