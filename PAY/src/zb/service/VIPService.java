package zb.service;

import zb.dao.impl.VIPDAOImpl;
import zb.po.VIP;

public class VIPService {
	private VIPDAOImpl vipDAOImpl;
	
	public VIPService() {
		vipDAOImpl = new VIPDAOImpl();
	}
	
	public VIP getOneInfo(int userid) {
		return vipDAOImpl.getOneInfo(userid);
	}
	
	public int add(int userid) {
		return vipDAOImpl.add(userid);
	}
	
}
