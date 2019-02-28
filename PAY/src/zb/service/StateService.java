package zb.service;

import java.util.List;
import java.util.Map;

import zb.dao.impl.StateDAOImpl;
import zb.po.State;

public class StateService {
	private StateDAOImpl stateDAOImpl;
	
	public StateService() {
		stateDAOImpl = new StateDAOImpl();
	}
	
	public List<State> getAllState() {
		return stateDAOImpl.getAllState();
	}
}
