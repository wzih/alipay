package zb.dao;

import zb.po.Taobao;

public interface TaobaoDAO {
	Taobao getOneInfo(int userid);//�����û�id��ѯ�󶨵��Ա��˺�
	
	int addInfo(int userid,int taobaoid);//���Ա��˺�
	
	int delInfo(int id);//����idɾ���Ա��˺�
}
