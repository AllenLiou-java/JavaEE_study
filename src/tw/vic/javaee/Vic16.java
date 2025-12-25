package tw.vic.javaee;

// Model - 建立類別，處理商業邏輯
public class Vic16 {
	private int x, y;
	private String op;
	
	public Vic16(String x, String y, String op){
		this.x = Integer.parseInt(x);
		this.y = Integer.parseInt(y);
		this.op = op;
	}
	
	public int opration() {
		int rs = 0;
		
		switch (op) {
			case "1": rs = x + y; break;
			case "2": rs = x - y; break;
			case "3": rs = x * y; break;
			case "4": rs = x / y; break;
		}
		
		return rs;
	}
}
