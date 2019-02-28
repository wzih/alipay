package zb.dao;

import java.util.Map;

import zb.po.VIP;

public interface VIPDAO {
	VIP getOneInfo(int userid);//根据用户id获取会员信息
	
	int add(int userid); //新增会员
}
