package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Config;
import model.Content;

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
		String re = request.getParameter("re");
		if (re.equals("false")) {
			new Content().addContent("Aldaris", request.getParameter("title"), request.getParameter("pretitle"),
					request.getParameter("inner"));
			Config.titleCount += 1;
		} else if (re.equals("true")) {
			new Content().updateContent(Integer.parseInt(request.getParameter("id")), request.getParameter("title"),
					request.getParameter("pretitle"), request.getParameter("inner"));
			Config.titleCount -= 1;
		} else if (re.equals("del")) {
			new Content().delContent(Integer.parseInt(request.getParameter("id")));
		}
	}

}
