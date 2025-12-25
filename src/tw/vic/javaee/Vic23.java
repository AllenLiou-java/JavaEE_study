package tw.vic.javaee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.vic.beans.BCrypt;

// 會員登入 - 驗證帳號密碼
// 帳號密碼正確 -> 前往 vic22.html
// 帳號密碼錯誤 -> 停留在原頁面 vic23.html
// 檢查是否有連上資料庫，並透過 response.sendError() 拋出指定錯誤碼/訊息

@WebServlet("/Vic23")
public class Vic23 extends HttpServlet {
	private PreparedStatement pstmt;
	private final String sql = "select * from member where account = ?";
	private boolean isMySQLOK;
       
    public Vic23() {
    	// 確認驅動程式是否載入成功
		// 記得先將connector jar檔放到路徑 \WebContent\WEB-INF\lib
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Properties prop = new Properties();
			prop.put("user", "root");
			prop.put("password", "");
			prop.put("serverTimezone", "Asia/Taipei");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vic", prop);
			pstmt = conn.prepareStatement(sql);
			
			System.out.println("ok");
			isMySQLOK = true;
		} catch (ClassNotFoundException e) {
			isMySQLOK = false;
			System.out.println(e.toString());
		} catch (SQLException e) {
			isMySQLOK = false;
			System.out.println(e.toString());
		}
		
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String account = request.getParameter("account");
		String passwd = request.getParameter("passwd");
		
		if(!isMySQLOK) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server Busy!");
			// 記得return， 否則會一直往下執行
			return;
		}
		
		if(checkAccount(account, passwd)) {
			response.sendRedirect("vic22.html");
		} else {
			System.out.println("passwd error");
			response.sendRedirect("vic23.html");
		}
	}
	
	private boolean checkAccount(String account, String passwd) {
		boolean isPWOK = false;
		try {
			pstmt.setString(1, account);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				isPWOK = BCrypt.checkpw(passwd, rs.getString("passwd"));
			}else {
				// 查無 account
			}
			
		} catch (SQLException e) {
			System.out.println(e.toString());
		}
		
		return isPWOK;
	}

}
