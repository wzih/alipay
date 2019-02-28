package zb.dao;

import java.util.List;

import zb.po.Bank;

public interface BankDAO {
	List<Bank> getAllBank();
	
	Bank getOneInfo(int userid);
}
