package tw.vic.javaee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 分配分支 - forward
 * Vic13 dispatch.forward() Vic14
 * 使用Vic13的路徑，由Vic14內容來顯示
 * 使用 dispatcher.forward() 可實作MVC運作流程
 * 
 * */

@WebServlet("/Vic13")
public class Vic13 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("Vic14");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("Hello Vic13");
		
		// 因為 後續會 forward 到 Vic14，所以由 Vic14執行 flushBuffer()
		// response.flushBuffer();

		dispatcher.forward(request, response);
	}

}
