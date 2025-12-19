package tw.vic.javaee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Vic06")
public class Vic06 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		
		int intX = Integer.parseInt(x);
		int intY = Integer.parseInt(y);
		int result = intX + intY;
		System.out.println(result);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out =response.getWriter();
		// println 是文檔的換列(原始碼)
		out.println("Hello World!<br>");
		// 若要換列，需在瀏覽器換列
		out.println(String.format("%d + %d = %d", intX, intY, result));
	}
}
