package zb.dao;

import zb.po.Yuebao;

public interface YuebaoDAO {
	Yuebao getOneInfo(int userid);//根据用户id查询余额宝信息
	
	int addInfo(int userid);//根据用户id开通余额宝
}
