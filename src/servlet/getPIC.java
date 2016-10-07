package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.User;
import tool.MD5Util;

/**
 * Servlet implementation class getPIC
 */
@WebServlet("/getPIC")
public class getPIC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public getPIC() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		try {
			String sRoot = request.getSession().getServletContext().getRealPath("/");
			String uploadPath = sRoot + "img/upload/";
			HttpSession session = request.getSession();
			User u = (User) session.getAttribute("uInfo");
			if (u.getLevel() < 2) {

				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setHeaderEncoding("UTF-8");
				if (!ServletFileUpload.isMultipartContent(request)) {
					return;
				}
				List<FileItem> list = upload.parseRequest(request);
				Iterator i = list.iterator();
				for (FileItem item : list) {
					if (!item.isFormField()) {
						while (i.hasNext()) {
							FileItem file = (FileItem) i.next();
							String sourcefileName = file.getName();
							if (sourcefileName != null
									&& (sourcefileName.endsWith(".jpg") || sourcefileName.endsWith(".png")
											|| sourcefileName.endsWith(".gif") || sourcefileName.endsWith(".webp"))) {
								String destinationfileName = null;
								String id = MD5Util.getMD5(file.getInputStream());
								if (sourcefileName.endsWith(".jpg")) {
									destinationfileName = id + ".jpg";
								} else if (sourcefileName.endsWith(".gif")) {
									destinationfileName = id + ".gif";
								} else if (sourcefileName.endsWith(".png")) {
									destinationfileName = id + ".png";
								} else if (sourcefileName.endsWith(".webp")) {
									destinationfileName = id + ".webp";
								}
								File pic = new File(uploadPath + destinationfileName);
								if (!pic.exists()) {
									file.write(pic);
								}
								out.println("img/upload/" + destinationfileName);
								System.out.println("用户图片保存到:" + pic.getAbsolutePath());
							}
						}
					}
				}
			} else {
				response.sendError(404);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(404);
		}
	}

}
