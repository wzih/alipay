package zb.service;

import java.util.List;

import zb.dao.impl.TypeDAOImpl;
import zb.po.Type;

public class TypeService {
	private TypeDAOImpl typeDAOImpl;
	
	public TypeService() {
		typeDAOImpl = new TypeDAOImpl();
	}
	
	public List<Type> getAllType() {
		return typeDAOImpl.getAllType();
	}
}
