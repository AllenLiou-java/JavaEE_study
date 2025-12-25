package tw.vic.javaee;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 將上傳的圖檔加上浮水印
// 可搭配 Vic09的(檔案)圖片上傳

// 使用 AffineTransform() 處理文字的變化(如：旋轉)
// 使用 Font.deriveFont(AffineTransform) 取得經過(變形)調整後的文字

// Graphics2D 畫上文字

@WebServlet("/Vic20")
public class Vic20 extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// 讀進圖片檔
		BufferedImage bimg = ImageIO.read(
				new File("D:/Vic Documents/eclipse-workspace/JavaEE/VicEE/WebContent/upload/book.jpg"));
		Graphics2D g2d = bimg.createGraphics();
		
		// 打上浮水印，文字左下右上傾斜45度
		AffineTransform tran = new AffineTransform();
		tran.rotate(Math.toRadians(-45), 0, 0);
		Font font = new Font(null, Font.BOLD, 48);
		Font font_r45 = font.deriveFont(tran);
		
		g2d.setFont(font_r45);
		g2d.setColor(Color.GREEN);
		g2d.drawString("您好，全世界!!", 300, 300);
		
//		// 將圖片透過response回傳
//		response.setContentType("image/jpeg");
//		OutputStream oout = response.getOutputStream();
//		ImageIO.write(bimg, "jpeg", oout);
//		oout.flush();
//		oout.close();
		
		// 將圖片另存
		FileOutputStream fout = new FileOutputStream(
				new File("D:/Vic Documents/eclipse-workspace/JavaEE/VicEE/WebContent/upload/book-1.jpg"));
		ImageIO.write(bimg, "jpeg", fout);
		fout.flush();
		fout.close();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append("save ok!");
	}

}
