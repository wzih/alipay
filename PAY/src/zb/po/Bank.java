package zb.po;

public class Bank {
	private int id;
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
	
	public Bank() {
		// TODO Auto-generated constructor stub
	}
	public Bank(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	
}
