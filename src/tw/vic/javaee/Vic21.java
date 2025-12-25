package tw.vic.javaee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.vic.beans.BCrypt;

@WebServlet("/Vic21")
public class Vic21 extends HttpServlet {

	public Vic21() {
		// 確認驅動程式是否載入成功
		// 記得先將connector jar檔放到路徑 \WebContent\WEB-INF\lib
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("ok");
		} catch (ClassNotFoundException e) {
			System.out.println(e.toString());
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String account = request.getParameter("account");
		String passwd = request.getParameter("passwd");
		String realname = request.getParameter("realname");
		
		boolean isAddSuccess = addMember(account, BCrypt.hashpw(passwd, BCrypt.gensalt()), realname);
		
		// response.sendRedirect() 將頁面轉向導至目標頁面
		// 註冊成功：前往vic22.html
		// 註冊失敗：前往vic21.html
		if(isAddSuccess) {
			response.sendRedirect("vic22.html");
		} else {
			response.sendRedirect("vic21.html");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	private boolean addMember(String account, String passwd, String realname) {
		Properties prop = new Properties();
		prop.put("user", "root");
		prop.put("password", "");
		prop.put("serverTimezone", "Asia/Taipei");
		
		int row = 0;
		
		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vic", prop);
			PreparedStatement pstmt = conn.prepareStatement(
					"INSERT INTO member (account, passwd, realname) VALUES(?, ?, ?)");
			pstmt.setString(1, account);
			pstmt.setString(2, passwd);
			pstmt.setString(3, realname);
			// executeUpdate() 返回 SQL Data Manipulation Language (DML) statements的row count，
			// 若更新失敗，則 return int 0,
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.toString());
		}
		
		return row != 0;
	}

}
