package zb.po;

public class Taobao {
	private int id;       //±‡∫≈
	private User user;    //”√ªß
	private int taobaoid; //Ã‘±¶id
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
	public int getTaobaoid() {
		return taobaoid;
	}
	public void setTaobaoid(int taobaoid) {
		this.taobaoid = taobaoid;
	}
	
	
	public Taobao() {
		// TODO Auto-generated constructor stub
	}
	public Taobao(int id, User user, int taobaoid) {
		super();
		this.id = id;
		this.user = user;
		this.taobaoid = taobaoid;
	}
	
}
