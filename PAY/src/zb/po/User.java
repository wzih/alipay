package zb.po;

import java.util.Date;

public class User {
	private Integer id;          //编号
	private String username;     //用户名
	private String loginPWD;     //登录密码
	private String payPwd;       //支付密码
	private Date registeRDate;   //注册日期
	private Date lastLoginDate;  //上次登录时间
	private String image;        //头像地址
	private int age;		     //用户年龄
	private String name;         //用户姓名
	private String idCard;       //身份证号
	private String tel;          //手机号
	private Integer account;     //账户余额
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getLoginPWD() {
		return loginPWD;
	}
	public void setLoginPWD(String loginPWD) {
		this.loginPWD = loginPWD;
	}
	public String getPayPwd() {
		return payPwd;
	}
	public void setPayPwd(String payPwd) {
		this.payPwd = payPwd;
	}
	public Date getRegisteRDate() {
		return registeRDate;
	}
	public void setRegisteRDate(Date registeRDate) {
		this.registeRDate = registeRDate;
	}
	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Integer getAccount() {
		return account;
	}
	public void setAccount(Integer account) {
		this.account = account;
	}
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(int id) {
		this.id = id;
	}
	
	public User(String username) {
		this.username = username;
	}
	
	public User(Integer id, String username, String loginPWD, String payPwd,
			Date registeRDate, Date lastLoginDate, String image, int age,
			String name, String idCard, String tel,int account) {
		super();
		this.id = id;
		this.username = username;
		this.loginPWD = loginPWD;
		this.payPwd = payPwd;
		this.registeRDate = registeRDate;
		this.lastLoginDate = lastLoginDate;
		this.image = image;
		this.age = age;
		this.name = name;
		this.idCard = idCard;
		this.tel = tel;
		this.account = account;
	}
	public User(String username, String name, String tel) {
		this.username = username;
		this.name = name;
		this.tel = tel;
	}
	public User(int id,String username, String tel) {
		this.id = id;
		this.username = username;
		this.tel = tel;
	}
	
	
}
