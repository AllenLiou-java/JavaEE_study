package tw.vic.javaee;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 進行整個系統的參數設定
// 設定整個系統context的參數檔位置： WebContent/WEB-INF/web.xml
// 下面以viewPath參數為範例

@WebServlet("/Vic18")
public class Vic18 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ServletContext context = getServletContext();
		String viewPath = context.getInitParameter("viewPath");
		System.out.println(viewPath);
	}

}
