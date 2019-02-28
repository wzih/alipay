package zb.service;

import java.util.Map;

import zb.dao.impl.HuabaiDAOImpl;
import zb.po.Huabai;

public class HuabaiService {
	private HuabaiDAOImpl huabaiDAOImpl;
	
	public HuabaiService() {
		huabaiDAOImpl = new HuabaiDAOImpl();
	}
	
	public Huabai getOneInfo(int userid) {
		return huabaiDAOImpl.getOneInfo(userid);
	}
	
	public int updateInfo(Map<String, Object> info) {
		return huabaiDAOImpl.updateInfo(info);
	}
	public int addInfo(int userid) {
		return huabaiDAOImpl.addInfo(userid);
	}
}
