package zb.dao;

import java.util.List;
import java.util.Map;

import zb.po.Bill;
import zb.po.UnReadMsg;

public interface UnreadMsgDAO {
	
	int addBill(Map<String, Object>info);//新增未读信息
	
	int delBill(int id);//删除未读信息
	
	List<UnReadMsg> getAllmsg( int id); //获取全部未读信息
}
