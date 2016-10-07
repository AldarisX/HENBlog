package servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Config;

import model.Content;
import tool.Tool;

/**
 * Servlet implementation class getBlog
 */
@WebServlet("/getBlog")
public class getBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public getBlog() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cm = request.getParameter("cm");
		if (cm.equals("false")) {
			String title = request.getParameter("title");
			String pretitle = request.getParameter("pretitle");
			String inner = request.getParameter("inner");
			if (title.equals("") || pretitle.equals("") || inner.equals("")) {
				response.sendError(404);
			} else {
				new Content().addContent(Config.bName, title, pretitle, inner);
				Config.titleCount += 1;
				Tool.delVMSP(new File(Config.warLoc + "/vmsp/"), "titlejson.jsp");
			}
		} else if (cm.equals("true")) {
			new Content().updateContent(Integer.parseInt(request.getParameter("id")), request.getParameter("title"),
					request.getParameter("pretitle"), request.getParameter("inner"));
			Config.titleCount -= 1;
		} else if (cm.equals("del")) {
			int id = Integer.parseInt(request.getParameter("id"));
			new Content().delContent(id);
			Tool.delVMSP(new File(Config.warLoc + "/vmsp/"), "contjson.jsptid-" + id + "-.json");
		}
	}

}
