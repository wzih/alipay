package zb.dao;

import zb.po.Yuebao;

public interface YuebaoDAO {
	Yuebao getOneInfo(int userid);//�����û�id��ѯ����Ϣ
	
	int addInfo(int userid);//�����û�id��ͨ��
}
