package tw.vic.javaee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.vic.beans.BCrypt;


@WebServlet("/Vic22")
public class Vic22 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String passwd = "123456";
		String hashPasswd = BCrypt.hashpw(passwd, BCrypt.gensalt());
		System.out.println(hashPasswd);
	}

}
