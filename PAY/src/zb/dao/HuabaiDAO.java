package zb.dao;

import java.util.Map;

import zb.po.Huabai;

public interface HuabaiDAO {
	Huabai getOneInfo(int userid);//�����û�ID���һ�����Ϣ
	
	int updateInfo(Map<String, Object> info);//���»�����Ϣ
	
	int addInfo(int userid);//����ID�������¹���
}
