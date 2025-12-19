package tw.vic.javaee;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Vic10")
public class Vic10 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		InputStream in = request.getInputStream();
		
		byte[] buf = new byte[4096];
		int len;
		while((len = in.read()) != -1) {
			System.out.println(new String(buf, 0, len));
		}
	}

}
