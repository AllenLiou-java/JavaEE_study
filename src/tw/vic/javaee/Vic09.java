package tw.vic.javaee;

import java.io.IOException;
import java.util.Calendar;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

//前端有加上 enctype="multipart/form-data"，後端也須加上@MultipartConfig
//upload dir => D:/Vic Documents/eclipse-workspace/JavaEE/VicEE/WebContent/upload

@WebServlet("/Vic09")
@MultipartConfig(
		location = "D:/Vic Documents/eclipse-workspace/JavaEE/VicEE/WebContent/upload"
		)
public class Vic09 extends HttpServlet {
       
//    // 父類別會透過 service()，根據request method類型，去調用 doGet() 或 doPost()
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) 
//			throws ServletException, IOException {
//		super.service(req, resp);
//		System.out.println("service()");
//	}
//
//	// 第一次請求時調用init()，之後就不再調用
//	@Override
//	public void init() throws ServletException {
//
//		super.init();
//		System.out.println("init()");
//	}


//	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
//			throws ServletException, IOException {
//		System.out.println("doGet");
//	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String prefix = request.getParameter("prefix");

		// 單一檔案上傳
//		Part part = request.getPart("upload");
//		// 檔案類型
//		String type = part.getContentType();
//		System.out.println(type);
//		
//		// 一般不會使用client端上傳檔案的原檔名
//		// input上的name值
//		String name1 = part.getName();
//		String name2 = part.getSubmittedFileName();
//		System.out.println(name1 + ":" + name2);
//		
//		part.write(createFileName(prefix));
		
		// 多檔案上傳
		Collection<Part> parts = request.getParts();
		// 包含 第一個input
		System.out.println(parts.size());
		
		for(Part part:parts) {
			if(part.getName().equals("upload")) {
				// 排除未填寫上傳檔案的欄位
				if(part.getSubmittedFileName().length() == 0)
					continue;
				System.out.println(part.getName());
				part.write(createFileName(prefix));
			}else {
				System.out.println(part.getName());
			}
		}
		
	}
	
	private String createFileName(String prename) {
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DAY_OF_MONTH);
		int hh = now.get(Calendar.HOUR);
		int mm = now.get(Calendar.MINUTE);
		int ss = now.get(Calendar.SECOND);
		int ms = now.get(Calendar.MILLISECOND);
		
		return prename + "_" + year
				+ (month<10?"0":"") + month
				+ (day<10?"0":"") + day
				+ (hh<10?"0":"") + hh
				+ (mm<10?"0":"") + mm
				+ (ss<10?"0":"") + ss + ms + ".jpg";
	}

}
