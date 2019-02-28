package zb.service;

import java.util.List;
import java.util.Map;

import zb.dao.impl.CardDAOImpl;
import zb.po.Card;

public class CardService {
	private CardDAOImpl cardDAOImpl;
	
	public CardService() {
		cardDAOImpl = new CardDAOImpl();
	}
	
	public List<Card> getAllCardById(int userid) {
		return cardDAOImpl.getAllCardById(userid);
	}
	
	public int getCount(int userid) {
		return cardDAOImpl.getCount(userid);
	}
	public int addCard(Map<String, Object> info) {
		return cardDAOImpl.addCard(info);
	}
	public int delCard(Map<String, Object> info) {
		return cardDAOImpl.delCard(info);
	}
}
