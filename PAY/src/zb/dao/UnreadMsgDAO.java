package zb.dao;

import java.util.List;
import java.util.Map;

import zb.po.Bill;
import zb.po.UnReadMsg;

public interface UnreadMsgDAO {
	
	int addBill(Map<String, Object>info);//����δ����Ϣ
	
	int delBill(int id);//ɾ��δ����Ϣ
	
	List<UnReadMsg> getAllmsg( int id); //��ȡȫ��δ����Ϣ
}
