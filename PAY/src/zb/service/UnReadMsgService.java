package zb.service;

import java.util.List;
import java.util.Map;

import zb.dao.impl.UnReadMsgDAOimpl;
import zb.po.UnReadMsg;

public class UnReadMsgService {
	UnReadMsgDAOimpl readMsgImpl ;
	public UnReadMsgService() {
		readMsgImpl =new UnReadMsgDAOimpl();
	}
	
	public int addmsg(Map<String, Object> info) {
		return readMsgImpl.addBill(info);
	}
	public int delmsg(int id){
		return readMsgImpl.delBill(id);
	}
	public List<UnReadMsg> getAllmsg(int id) {
		return readMsgImpl.getAllmsg(id);
	}
}
