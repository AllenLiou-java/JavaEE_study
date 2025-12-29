package tw.vic.beans;

public class Member {
	private String id, account, realname;
	private int age;
	
	public Member() {
		this("1", "2", "3");
	}
	
	public Member(String id, String account, String realname) {
		this.id = id;
		this.account = account;
		this.realname = realname;
		this.age = 18;
	}
	
	public String getAccount() {
		return account;
	}
	
	public int getAge() {
		return age;
	}
	
	public void addAge() {
		age++;
	}
	
	public String getRealname() {
		return realname;
	}
	
	public void setRealname(String realname) {
		this.realname= realname;
	}
}
