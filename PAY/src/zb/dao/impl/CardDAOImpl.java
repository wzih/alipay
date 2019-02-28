package zb.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import zb.dao.BaseDAO;
import zb.dao.CardDAO;
import zb.po.Bank;
import zb.po.Card;
import zb.po.User;

public class CardDAOImpl extends BaseDAO implements CardDAO {

	public List<Card> getAllCardById(int userid) {
		String sql = "SELECT C.ID CID,USERID,BANKCARDID,NAME,B.ID BID FROM CARD C INNER JOIN BANK B ON B.ID = C.BANKID WHERE USERID = ?";
		rs = executeQuery(sql, userid);
		List<Card> cards = new ArrayList<Card>();
		try {
			while(rs.next()){
				cards.add(new Card(rs.getInt("cid"),new User(rs.getInt("userid")), rs.getString("bankcardid"),new Bank(rs.getInt("bid"), rs.getString("name"))));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return cards;
	}

	public int getCount(int userid) {
		String sql = "SELECT COUNT(1) count FROM CARD WHERE USERID = ?";
		rs = executeQuery(sql, userid);
		int count = 0;
		try {
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll();
		}
		
		return count;
	}

	public int addCard(Map<String, Object> info) {
		int userid= Integer.valueOf(info.get("userid").toString());
		String cardNum = info.get("cardNum").toString();
		int bankid = Integer.valueOf(info.get("bankid").toString());
		String sql = "INSERT INTO CARD VALUES(NULL,?,?,?)";
		return executeUpdate(sql, userid,cardNum,bankid);
	}

	public int delCard(Map<String, Object> info) {
		int id= Integer.valueOf(info.get("id").toString());
		String sql = "DELETE FROM CARD WHERE ID = ?";
		return executeUpdate(sql,id);
	}

}
