package tw.vic.javaee;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Vic03
 */
@WebServlet("/Vic03")
public class Vic03 extends HttpServlet {

	//取得request帶過來的params - getParameter()
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Enumeration<String> params = request.getParameterNames();
		while(params.hasMoreElements()) {
			String param = params.nextElement();
			String value = request.getParameter(param);
			System.out.println(param + ":" + value);
		}
	}

}
