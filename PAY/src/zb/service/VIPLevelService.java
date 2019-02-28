package zb.service;

import java.util.List;

import zb.dao.impl.VIPLevelDAOImpl;
import zb.po.VIPLevel;

public class VIPLevelService {
	private VIPLevelDAOImpl vipLevelDAOImpl;
	
	public VIPLevelService() {
		vipLevelDAOImpl = new VIPLevelDAOImpl();
	}
	
	public List<VIPLevel> getAllLevel() {
		return vipLevelDAOImpl.getAllLevel();
	}
}
