package tw.vic.beans;

public class Cust {
	private int id;
	private String cname, realname, birthday;
	
	public Cust() {
		
	}
	
	private Cust(String cname, String realname, String birthday) {
		id = -1;
		this.cname = cname;
		this.realname = realname;
		this.birthday = birthday;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return this.id;
	}
	
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCname() {
		return this.cname;
	}
	
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getRealname() {
		return this.realname;
	}
	
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getBirthday() {
		return this.birthday;
	}
	
	@Override
	public String toString() {
		return "Vic";
	}
}
