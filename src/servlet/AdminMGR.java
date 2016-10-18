package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
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

import com.Config;
import com.JDBCUtils;

import model.User;
import tool.MD5Util;
import tool.Tool;

/**
 * Servlet implementation class AdminMGR
 */
@WebServlet("/AdminMGR")
public class AdminMGR extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminMGR() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User u = (User) request.getSession().getAttribute("uInfo");
			if (u.getLevel() <= 2) {
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				String cm = request.getParameter("cm");
				switch (cm) {
				case "delVMSP":
					Tool.dirClean(new File(Config.warLoc + "/vmsp/"), true);
					break;
				case "getIMG":
					String sRoot = request.getSession().getServletContext().getRealPath("/");
					String uploadPath = sRoot + "img/upload/";
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
								if (sourcefileName != null && (sourcefileName.endsWith(".jpg")
										|| sourcefileName.endsWith(".png") || sourcefileName.endsWith(".gif")
										|| sourcefileName.endsWith(".webp"))) {
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
									Config.background = "img/upload/" + destinationfileName;
									JDBCUtils JDBC = new JDBCUtils();
									PreparedStatement ps = JDBC.getPST(
											"UPDATE `n_blog`.`option` SET `value`=? WHERE `type`='background';");
									ps.setString(1, Config.background);
									if (JDBC.getUpdate(ps) != 1) {
										out.print("检测到异常,请检查数据库时候完整");
									} else {
										response.sendRedirect("index.jsp");
									}
								} else {
									out.println("不支持的文件类型");
								}
							}
						}
					}
					break;
				}
			} else {
				response.sendError(404);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(404);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
