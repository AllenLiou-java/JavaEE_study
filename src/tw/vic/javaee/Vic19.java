package tw.vic.javaee;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 透過後端伺服器畫色塊，並傳回前端
@WebServlet("/Vic19")
public class Vic19 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String rate = request.getParameter("rate");
		float frate = 0;
		if(rate != null) {
			try {
				frate = Float.parseFloat(rate);
			}catch(Exception e) {
				frate = 0;
			}
		}
		
		response.setContentType("image/jpeg");
		BufferedImage bimg = new BufferedImage(400, 20, BufferedImage.TYPE_INT_RGB);
		
		Graphics2D g2d = bimg.createGraphics();
		// 畫圖
		g2d.setColor(Color.YELLOW);
		g2d.fillRect(0, 0, bimg.getWidth(), bimg.getHeight());
		g2d.setColor(Color.RED);
		g2d.fillRect(0, 0, (int)(bimg.getWidth() * (frate/100)), bimg.getHeight());
		
		OutputStream oout = response.getOutputStream();
		ImageIO.write(bimg, "jpeg", oout);
		oout.flush();
		oout.close();
	}
}
