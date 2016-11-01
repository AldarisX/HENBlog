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
import model.Talk;
import model.User;
import tool.Tool;

/**
 * Servlet implementation class GetBlog
 */
@WebServlet("/GetBlog")
public class GetBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetBlog() {
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

		switch (cm) {
		case "false":
			String title = request.getParameter("title");
			String pretitle = request.getParameter("pretitle");
			String inner = request.getParameter("inner");
			if (title.equals("") || pretitle.equals("") || inner.equals("")) {
				response.sendError(404);
			} else {
				new Content().addContent(Config.bName, title, pretitle, inner);
				Config.titleCount += 1;
				Tool.delVMSP(new File(Config.warLoc + "/vmsp/"), "titlejson");
			}
			break;

		case "true":
			int id = Integer.parseInt(request.getParameter("id"));
			new Content().updateContent(id, request.getParameter("title"),
					request.getParameter("pretitle"), request.getParameter("inner"));
			Config.titleCount -= 1;
			Tool.delVMSP(new File(Config.warLoc + "/vmsp/"), "titlejson");
			Tool.delVMSP(new File(Config.warLoc + "/vmsp/"), "contjson.jsptid-" + id + "-.json");
			break;
		case "del":
			int idd = Integer.parseInt(request.getParameter("id"));
			new Content().delContent(idd);
			Tool.delVMSP(new File(Config.warLoc + "/vmsp/"), "titlejson");
			Tool.delVMSP(new File(Config.warLoc + "/vmsp/"), "contjson.jsptid-" + idd + "-.json");
			break;
		case "addTalk":
			int tid = Integer.parseInt(request.getParameter("tid"));
			String uName = ((User)request.getSession().getAttribute("uInfo")).getUserName();
			String content = request.getParameter("content");
			new Talk().addTalk(tid, uName, content);
			Tool.delVMSP(new File(Config.warLoc + "/vmsp/"), "talkjson.jsptid-" + tid + "-.json");
			break;
		}
	}

}
