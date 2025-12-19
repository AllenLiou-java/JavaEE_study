package tw.vic.javaee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Vic08")
public class Vic08 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		
		if(hobbys != null) {
			for(String hobby:hobbys) {
				System.out.println(hobby);
			}
		}
		
	}

}
