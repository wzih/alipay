package zb.po;

public class Friends {
	private int id;          //±‡∫≈
	private User user;       //”√ªß
	private User friend;   //∫√”—id
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
	public User getFriend() {
		return friend;
	}
	public void setFriend(User friend) {
		this.friend = friend;
	}
	
	public Friends() {
		// TODO Auto-generated constructor stub
	}
	public Friends(int id, User user, User friend) {
		super();
		this.id = id;
		this.user = user;
		this.friend = friend;
	}
	
	
}
