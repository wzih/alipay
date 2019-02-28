package zb.service;

import zb.dao.impl.YuebaoDAOImpl;
import zb.po.Yuebao;

public class YuebaoService {
	private YuebaoDAOImpl yuebaoDAOImpl;
	
	public YuebaoService() {
		yuebaoDAOImpl = new YuebaoDAOImpl();
	}
	
	public Yuebao getOneInfo(int userid) {
		return yuebaoDAOImpl.getOneInfo(userid);
	}
	
	public int addInfo(int userid) {
		return yuebaoDAOImpl.addInfo(userid);
	}
}
