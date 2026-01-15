package tw.vic.beans;

public class Member2 {
	private String account;
	private int lotto;
	
	public Member2(String account, int lotto) {
		this.account = account;
		this.lotto = lotto;
	}
	
	public String getAccount() {
		return this.account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
	public int getLotto() {
		return this.lotto;
	}
	public void setLotto(int lotto) {
		this.lotto = lotto;
	}
}
