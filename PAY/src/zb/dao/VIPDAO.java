package zb.dao;

import java.util.Map;

import zb.po.VIP;

public interface VIPDAO {
	VIP getOneInfo(int userid);//�����û�id��ȡ��Ա��Ϣ
	
	int add(int userid); //������Ա
}
