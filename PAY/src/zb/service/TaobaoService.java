package zb.service;

import zb.dao.impl.TaobaoDAOImpl;
import zb.po.Taobao;

public class TaobaoService {
	private TaobaoDAOImpl taobaoDAOImpl;
	public TaobaoService() {
		taobaoDAOImpl = new TaobaoDAOImpl();
	}
	
	public Taobao getOneInfo(int userid) {
		return taobaoDAOImpl.getOneInfo(userid);
	}
	
	public int addInfo(int userid, int taobaoid) {
		return taobaoDAOImpl.addInfo(userid, taobaoid);
	}
	
	public int delInfo(int id) {
		return taobaoDAOImpl.delInfo(id);
	}
}
