package zb.dao;

import java.util.List;
import java.util.Map;

import zb.po.Card;

public interface CardDAO {
	List<Card> getAllCardById(int userid);//根据用户ID查所有绑定的银行卡
	
	int getCount(int userid);//根据用户ID获取用户的银行卡数量
	
	int addCard(Map<String, Object>info);//新增银行卡
	
	int delCard(Map<String, Object>info);//删除银行卡
}
