package zb.po;

public class Huabai {
	private int id;             //���
	private User user;          //�û�
	private int totalamount;    //�ܽ��
	private int availableamount;//���ý��
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
	public int getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(int totalamount) {
		this.totalamount = totalamount;
	}
	public int getAvailableamount() {
		return availableamount;
	}
	public void setAvailableamount(int availableamount) {
		this.availableamount = availableamount;
	}
	
	public Huabai() {
		// TODO Auto-generated constructor stub
	}
	public Huabai(int id, User user, int totalamount, int availableamount) {
		super();
		this.id = id;
		this.user = user;
		this.totalamount = totalamount;
		this.availableamount = availableamount;
	}
	
	
}
