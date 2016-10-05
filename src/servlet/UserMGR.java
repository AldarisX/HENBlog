package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JDBCUtils;

import model.User;
import tool.MD5Util;

/**
 * Servlet implementation class UserMGR
 */
@WebServlet("/UserMGR")
public class UserMGR extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserMGR() {
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
		PrintWriter out = response.getWriter(); 
		
		String cm = request.getParameter("cm");
		if (cm.equals("login")) {
			String userName = request.getParameter("uName");
			String passwd = MD5Util.string2MD5(request.getParameter("passwd"));
			JDBCUtils JDBC;
			try {
				JDBC = new JDBCUtils();
				PreparedStatement ps = JDBC.getPST("select * from user where userName=? and passwd=?");
				ps.setString(1, userName);
				ps.setString(2, passwd);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					User u = new User();
					u.setUserName(rs.getString("userName"));
					u.setEmail(rs.getString("email"));
					u.setLevel(rs.getInt("level"));
					HttpSession session = request.getSession();
					session.setAttribute("uInfo", u);
					session.setAttribute("isLogin", true);
					out.println("succ");
				} else {
					//out.println("fail");
					response.sendError(401);
				}
				JDBC.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}