package tw.vic.beans;

public class VicApi {
	public static String sayHi(String name) {
		return String.format("Hi, %s", name);
	}
	public static String calc(String x, String y, String op) {
		String ret = "";
		
		try {
			int intX = Integer.parseInt(x);
			int intY = Integer.parseInt(y);
			switch(op) {
				case "1": ret += intX + intY; break;
				case "2": ret += intX - intY; break;
				case "3": ret += intX * intY; break;
				case "4": ret += intX / intY; break;
			}
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return ret;
	}
}
