package tw.vic.javaee;

import java.io.IOException;
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
		
		
		// 2. 呼叫 model
	}

}
