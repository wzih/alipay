package zb.dao;

import java.util.List;
import java.util.Map;

import zb.po.Bill;

public interface BillDAO {
	List<Bill> getAllInfo(Map<String, Object> info); //����������ȡ�˵�
	
	int addBill(Map<String, Object>info);//�����˵���Ϣ
	
	int delBill(Map<String, Object>info);//ɾ���˵���Ϣ
}
