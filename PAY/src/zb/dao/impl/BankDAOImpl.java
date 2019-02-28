package zb.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import zb.dao.BankDAO;
import zb.dao.BaseDAO;
import zb.po.Bank;

public class BankDAOImpl extends BaseDAO implements BankDAO {

	public List<Bank> getAllBank() {
		String sql = "SELECT * FROM BANK";
		List<Bank> banks = new ArrayList<Bank>();
		rs = executeQuery(sql);
		try {
			while(rs.next()){
				banks.add(new Bank(rs.getInt("id"), rs.getString("name")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return banks;
	}

	public Bank getOneInfo(int userid) {
		String sql = "SELECT * FROM BANK WHERE USERID = ?";
		Bank bank = null;
		rs = executeQuery(sql,userid);
		try {
			if(rs.next()){
				bank = new Bank(rs.getInt("id"), rs.getString("name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return bank;
	}

}
