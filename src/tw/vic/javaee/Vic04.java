package tw.vic.javaee;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Vic04")
public class Vic04 extends HttpServlet {
	// 若有兩個相同參數透過request傳到伺服器，如何兩個都讀取 - getParameterMap()
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Map<String, String[]> map = request.getParameterMap();
		Set<String> keys = map.keySet();
		for(String key:keys) {
			String[] values = map.get(key);
			System.out.println(key);
			for(String value:values) {
				System.out.println(value);
			}
			System.out.println("-----");
		}
	}


}
