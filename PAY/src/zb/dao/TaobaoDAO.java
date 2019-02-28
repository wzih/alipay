package zb.dao;

import zb.po.Taobao;

public interface TaobaoDAO {
	Taobao getOneInfo(int userid);//根据用户id查询绑定的淘宝账号
	
	int addInfo(int userid,int taobaoid);//绑定淘宝账号
	
	int delInfo(int id);//根据id删除淘宝账号
}
