package zb.po;

public class VIP {
	private int id;
	private User user;
	private VIPLevel vipid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public VIPLevel getVipid() {
		return vipid;
	}
	public void setVipid(VIPLevel vipid) {
		this.vipid = vipid;
	}
	
	public VIP() {
		// TODO Auto-generated constructor stub
	}
	public VIP(int id, User user, VIPLevel vipid) {
		super();
		this.id = id;
		this.user = user;
		this.vipid = vipid;
	}
	
}
