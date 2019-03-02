package zb.po;

import java.util.Date;

public class UnReadMsg {
	private int id;
	private String type;
	private String account;
	private Date date;
	private int money;
	public UnReadMsg() {
		// TODO Auto-generated constructor stub
	}
	public UnReadMsg(int id, String type, String account, Date date, int money) {
		super();
		this.id = id;
		this.type = type;
		this.account = account;
		this.date = date;
		this.money = money;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	@Override
	public String toString() {
		return "UnReadMsg [id=" + id + ", type=" + type + ", account=" + account + ", date=" + date + ", money=" + money
				+ "]";
	}
	

}
