package tw.vic.javaee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Vic07")
public class Vic07 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		String op = request.getParameter("op");
		
		int intX, intY;
		String result;
		intX = intY = 0;
		result = "";
		
		if(x != null) {
			
			try {
				intX = Integer.parseInt(x);
				intY = Integer.parseInt(y);
				
				switch(op) {
					case "1":
						result = Integer.toString(intX + intY);
						break;
					case "2":
						result = Integer.toString(intX - intY);
						break;
					case "3":
						result = Integer.toString(intX * intY);
						break;
					case "4":
						result = String.format("%d...%d", intX / intY, intX % intY);
						break;
				}
				
			}catch(Exception e) {
				intX = intY = 0;
			}
		}
		
		if(op == null) op = "1";
		
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.append("<meta charset='UTF-8' />")
		.append("<h1>Vic Company</h1>")
		.append("<hr />")
		.append("<form action='Vic07'>")
		.append("<input type='number' name='x' value='" + intX +  "' />\n")
		.append("<select name='op'>")
		.append("<option value='1' "+ (op.equals("1")?"selected": "") +">+</option>")
		.append("<option value='2' "+ (op.equals("2")?"selected": "") +">-</option>")
		.append("<option value='3' "+ (op.equals("3")?"selected": "") +">X</option>")
		.append("<option value='4' "+ (op.equals("4")?"selected": "") +">/</option>")
		.append("</select>\n")
		.append("<input type='number' name='y' value='" + intY + "' />\n")
		.append("<input type='submit' value='=' />\n")
		.append(result)
		.append("</form>");
	}

	

}
