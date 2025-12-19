package tw.vic.javaee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 從Vic11 dispatch 到 Vic12
@WebServlet("/Vic12")
public class Vic12 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		Integer lotto = (Integer) request.getAttribute("lotto");

		String test = request.getParameter("test");
		String name = request.getParameter("name");

		PrintWriter out = response.getWriter();
		out.print("<h3>【Vic12】attribute-lotto is from Vic11 - " + lotto + "</h3>");
		out.print("<h3>【Vic12】params is from Vic11 - " + test + "</h3>");
		out.print("<h3>【Vic12】params is from url - " + name + "</h3>");
		out.print("<hr />");
		response.flushBuffer();
	}

}
