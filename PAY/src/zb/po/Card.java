package zb.po;

public class Card {
	private int id;               //���
	private User user;            //�û�
	private String bankcardid;    //���п�����
	private Bank bank;      //��������
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
	public String getBankcardid() {
		return bankcardid;
	}
	public void setBankcardid(String bankcardid) {
		this.bankcardid = bankcardid;
	}
	public Bank getBank() {
		return bank;
	}
	public void setBank(Bank bank) {
		this.bank = bank;
	}
	
	public Card() {
		// TODO Auto-generated constructor stub
	}
	public Card(int id, User user, String bankcardid,Bank bank) {
		super();
		this.id = id;
		this.user = user;
		this.bankcardid = bankcardid;
		this.bank = bank;
	}
	
	
}
