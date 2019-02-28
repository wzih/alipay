package zb.po;

public class State {
	private int id;         //±àºÅ
	private String name;    //×´Ì¬Ãû³Æ
	
	
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
	
	
	public State() {
		// TODO Auto-generated constructor stub
	}
	public State(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public State( String name) {
		super();
		this.name = name;
	}
}
