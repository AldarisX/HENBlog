package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Config;

import model.User;
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User u = (User) request.getSession().getAttribute("uInfo");
			if (u.getLevel() <= 2) {
				String cm = request.getParameter("cm");
				switch (cm) {
				case "delVMSP":
					Tool.dirClean(new File(Config.warLoc + "/vmsp/"), true);
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

}
