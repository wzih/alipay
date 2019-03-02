package zb.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import zb.dao.BaseDAO;
import zb.dao.UnreadMsgDAO;
import zb.po.Bill;
import zb.po.UnReadMsg;

public class UnReadMsgDAOimpl extends BaseDAO implements UnreadMsgDAO {

	public int addBill(Map<String, Object> info) {
//		info.put("msgmoney", msgmoney); int
//		info.put("msgaccount", msgaccount); String
//		info.put("msgtype", msgtype); String 
//		info.put("msgdata", msgdate); Date

		String account =  (String) info.get("msgaccount");//中国工商银行|尾号8740|
		Date data =   (Date) info.get("msgdata");//2019-03-02 15:42:54
		int money =  (Integer) info.get("msgmoney");//111
		int who =  1007;//(Integer) info.get("userid");//1007
		System.out.println("`````````````type:转账");
		System.out.println("``````````account:"+account);
		System.out.println("``````````data:"+data);
		System.out.println("````````````````money:"+money);
		System.out.println("``````````userid:"+who);
		String sql="insert `unreadmsg`(`type`,`account`,`date`,`money`,`who`) values('转账',?,?,?,?);";
		return executeUpdate(sql,account,data,money,who);
		
	}

	public int delBill(int id) {
		String sql = "DELETE FROM unreadmsg WHERE id = ?";
		return executeUpdate(sql, id);
	}
	
	public List<UnReadMsg> getAllmsg(int id) {
		List<UnReadMsg> msgs = new ArrayList<UnReadMsg>();
		String sql="select * from unreadmsg where who=?";
		rs = executeQuery(sql,id);
		try {
			while(rs.next()){
				msgs.add(new UnReadMsg(rs.getInt("id"), rs.getString("type"), rs.getString("account"), rs.getDate("date"), rs.getInt("money")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return msgs;
	}

}
