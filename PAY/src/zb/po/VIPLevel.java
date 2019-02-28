package zb.po;

public class VIPLevel {
	private int id;      //±àºÅ
	private String name; //vipµÈ¼¶
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public VIPLevel() {
		// TODO Auto-generated constructor stub
	}
	public VIPLevel(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public VIPLevel(String name) {
		super();
		this.name = name;
	}
	
}
