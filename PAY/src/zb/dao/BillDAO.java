package zb.dao;

import java.util.List;
import java.util.Map;

import zb.po.Bill;

public interface BillDAO {
	List<Bill> getAllInfo(Map<String, Object> info); //根据条件获取账单
	
	int addBill(Map<String, Object>info);//新增账单信息
	
	int delBill(Map<String, Object>info);//删除账单信息
}
