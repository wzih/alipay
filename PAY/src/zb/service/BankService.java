package zb.service;

import java.util.List;

import zb.dao.impl.BankDAOImpl;
import zb.po.Bank;

public class BankService {
	private BankDAOImpl bankDAOImpl;
	
	public BankService() {
		bankDAOImpl = new BankDAOImpl();
	}
	
	public List<Bank> getAllBank() {
		return bankDAOImpl.getAllBank();
	}
	
	public Bank getOneInfo(int userid) {
		return bankDAOImpl.getOneInfo(userid);
	}
}
