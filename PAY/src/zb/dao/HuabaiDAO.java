package zb.dao;

import java.util.Map;

import zb.po.Huabai;

public interface HuabaiDAO {
	Huabai getOneInfo(int userid);//根据用户ID查找花呗信息
	
	int updateInfo(Map<String, Object> info);//更新花呗信息
	
	int addInfo(int userid);//根据ID新增花呗功能
}
