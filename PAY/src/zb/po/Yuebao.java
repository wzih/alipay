package zb.po;

public class Yuebao {
	private int id;      //±‡∫≈
	private User user;   //”√ªß
	private int balance; //”‡∂Ó
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
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	public Yuebao() {
		// TODO Auto-generated constructor stub
	}
	public Yuebao(int id, User user, int balance) {
		super();
		this.id = id;
		this.user = user;
		this.balance = balance;
	}
	
	
}
