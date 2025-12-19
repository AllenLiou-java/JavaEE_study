package tw.vic.javaee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Test")
public class Test extends HttpServlet {
	// 伺服器第一次啟動時，會先將未編譯的檔案進行編譯，
	// 伺服器啟動後，第一次的request請求會先建立此物件實體(建構物件花費時間較久)，會執行建構式
	// 後續的請求都是透過此物件來處理，故不會再執行建構式
	public Test() {
		System.out.println("Test()");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet()");
	}

}
