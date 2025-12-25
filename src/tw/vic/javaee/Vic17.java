package tw.vic.javaee;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// View - 產生畫面內容
@WebServlet("/Vic17")
public class Vic17 extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
			String x = request.getParameter("x");
			String y = request.getParameter("y");
			String r = request.getParameter("r");
			String filename = request.getParameter("f");
			String op = request.getParameter("op");
					
			String op1 = op.equals("1")? "selected": "";
			String op2 = op.equals("2")? "selected": "";
			String op3 = op.equals("3")? "selected": "";
			String op4 = op.equals("4")? "selected": "";
			
			PrintWriter out = response.getWriter();
			String content = loadView(filename);
			out.print(String.format(content, x, op1, op2, op3, op4, y, r));
			response.flushBuffer();
	}
	
	private String loadView(String filename) throws IOException {
		ServletContext context = getServletContext();
		String viewPath = context.getInitParameter("viewPath");
		
		// 讀取html文檔
		StringBuffer sb = new StringBuffer();
		BufferedReader reader = new BufferedReader(
				new FileReader(new File(viewPath, filename)));
		
		String line;
		while((line = reader.readLine()) != null) {
			sb.append(line);
		}
		reader.close();
		
		return sb.toString();
	}

}
