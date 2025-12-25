package tw.vic.javaee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * Vic15 - Controller
 * Vic16 (並非Servlet，只是普通類別) - Model
 * Vic17 - View
 * */

@WebServlet("/Vic15")
public class Vic15 extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		// 1. prepare data
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		String op = request.getParameter("op");
		
		// 因為url有可能不帶任何參數，導致 x,y為null，這樣會導致後續發生錯誤
		if(x == null) x = "0";
		if(y == null) y = "0";
		if(op == null) op = "1";
		
		// 2. 呼叫 model
		Vic16 model = new Vic16(x, y, op);
		int result = model.opration();
		
		// 3. view
		// 因為單純的html檔案並無法帶入參數，所以透過servlet來產生可帶入參數後的html
		RequestDispatcher dispatcher =  request.getRequestDispatcher(
				String.format("Vic17?x=%s&op=%s&y=%s&r=%d&f=%s", x, op, y, result, "vic17.html"));
		dispatcher.forward(request, response);
	}

}
