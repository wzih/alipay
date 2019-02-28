package zb.po;

import java.util.Date;

public class Bill {
	private int id;             //编号
	private User user;          //用户
	private Type type;          //类型
	private State state;        //状态
	private int money;          //金额
	private String description; //描述
	private User otheruser;     //其他用户
	private Date createDate;    //创建时间
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
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public State getState() {
		return state;
	}
	public void setState(State state) {
		this.state = state;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	public User getOtheruser() {
		return otheruser;
	}
	public void setOtheruser(User otheruser) {
		this.otheruser = otheruser;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Bill() {
		// TODO Auto-generated constructor stub
	}
	public Bill(int id, User user, Type type, State state, int money,
			String description,Date createDate,User otheruser) {
		super();
		this.id = id;
		this.user = user;
		this.type = type;
		this.state = state;
		this.money = money;
		this.description = description;
		this.createDate = createDate;
		this.otheruser = otheruser;
	}
	
}
