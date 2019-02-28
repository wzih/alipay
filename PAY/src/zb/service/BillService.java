package zb.service;

import java.util.List;
import java.util.Map;

import zb.dao.impl.BillDAOImpl;
import zb.po.Bill;

public class BillService {
	private BillDAOImpl billDAOImpl;
	public BillService() {
		billDAOImpl = new BillDAOImpl();
	}
	
	public List<Bill> getAllInfo(Map<String, Object>info) {
		return billDAOImpl.getAllInfo(info);
	}
	
	public int addBill(Map<String, Object> info) {
		return billDAOImpl.addBill(info);
	}
	public int delBill(Map<String, Object> info) {
		return billDAOImpl.delBill(info);
	}
}
