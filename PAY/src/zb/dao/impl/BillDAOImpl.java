package zb.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import zb.dao.BaseDAO;
import zb.dao.BillDAO;
import zb.po.Bill;
import zb.po.State;
import zb.po.Type;
import zb.po.User;

public class BillDAOImpl extends BaseDAO implements BillDAO {

	public List<Bill> getAllInfo(Map<String, Object> info) {
		int userid = Integer.valueOf(info.get("userid").toString());
		int typeid = Integer.valueOf(info.get("typeid").toString());
		int stateid = Integer.valueOf(info.get("stateid").toString());
		String createDate1 = info.get("createDate1").toString();
		String createDate2 = info.get("createDate2").toString();
		String sql = "SELECT B.ID,T.NAME TNAME,S.NAME SNAME,MONEY,DESCRIPTION,U2.USERNAME OTHERUSERNAME,CREATEDATE FROM BILL B INNER JOIN TYPE T ON B.TYPEID=T.ID INNER JOIN STATE S ON B.STATEID=S.ID INNER JOIN USER U1 ON B.USERID = U1.ID  INNER JOIN USER U2 ON B.OTHERUSERID = U2.ID  WHERE USERID = ? AND (CREATEDATE BETWEEN ? AND ?)";
		System.out.println(createDate1);
		System.out.println(createDate2);
		System.out.println(sql);
		if (typeid!=0&&stateid==0) {
			sql+=" AND TYPEID = ?";
			rs=executeQuery(sql, userid,createDate1,createDate2,typeid);
		}else if (typeid==0&&stateid!=0) {
			sql+=" AND STATEID = ?";
			rs=executeQuery(sql, userid,createDate1,createDate2,stateid);
		}else if (typeid!=0&&stateid!=0) {
			sql+=" AND TYPEID = ? AND STATEID = ?";
			rs=executeQuery(sql, userid,createDate1,createDate2,typeid,stateid);
		}else {
			rs = executeQuery(sql, userid,createDate1,createDate2);
		}
		
		List<Bill> bills = new ArrayList<Bill>();
		try {
			while(rs.next()){
				bills.add(new Bill(rs.getInt("id"),null, new Type(rs.getString("tname")), new State(rs.getString("sname")), rs.getInt("money"), rs.getString("description"),rs.getDate("createDate"),new User(rs.getString("otherusername"))));
				System.out.println(bills);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return bills;
	}

	public int addBill(Map<String, Object> info) {
		int userid = Integer.valueOf(info.get("userid").toString());
		int typeid = Integer.valueOf(info.get("typeid").toString());
		int stateid = Integer.valueOf(info.get("stateid").toString());
		int money = Integer.valueOf(info.get("money").toString());
		int otheruserid = Integer.valueOf(info.get("otheruserid").toString());
		Date date = new Date();
		String description = info.get("description").toString();
		String sql = "INSERT INTO BILL(USERID,TYPEID,STATEID,MONEY,CREATEDATE,OTHERUSERID,DESCRIPTION) VALUES(?,?,?,?,?,?,?);";
		return executeUpdate(sql,userid,typeid,stateid,money,date,otheruserid,description);
	}

	public int delBill(Map<String, Object> info) {
		int id = Integer.valueOf(info.get("billid").toString());
		String sql = "DELETE FROM BILL WHERE ID = ?";
		return executeUpdate(sql, id);
	}

	public List<Bill> getInfo(Map<String, Object> info) {
		
		return null;
	}

}
