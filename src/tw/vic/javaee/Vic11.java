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
 * 分配分支 - include
 * 執行Vic11的servlet，將Vic12 的servlet內容 include 到Vic11。
 * request.getRequestDispatcher(path) ，path 可以是 1)指定的 servlet。 2)指定的html。
 * 使用 dispatcher.include(request, response); 將指定的內容引入。
 * request物件處理整個流程。
 * 
 * 測試url - http://localhost:8080/VicEE/Vic11?name=123&test=world
 * 
 * */

@WebServlet("/Vic11")
public class Vic11 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		// 透過request.setAttribute()將商業邏輯的結果帶到Vic12
		request.setAttribute("lotto", (int) (Math.random() * 49 + 1));

		String test = request.getParameter("test");
		if (test == null)
			test = "defaultTest";

		// Dispatcher的路徑可以夾帶參數
		RequestDispatcher dispatcher = request.getRequestDispatcher("Vic12?test=" + test);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.print("<h1>Hello, Vic!</h1><hr />");

		// 透過include將共用的servlet帶進來
		// 將Vic11 的 request帶過去 Dispatcher path Vic12，同時也把Parameter帶過去
		dispatcher.include(request, response);

		out.print("<h3>I am Vic</h3><hr/>");

		// 將新的Dispatcher path 指向給 dispatcher
		dispatcher = request.getRequestDispatcher("vic11.html");
		dispatcher.include(request, response);

		out.print("End");

		// 以下flush擇一即可
		// out.flush();
		response.flushBuffer();
	}

}
