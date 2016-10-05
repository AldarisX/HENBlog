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
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cm = request.getParameter("cm");
		if (cm.equals("logout")) {
			HttpSession httpsession = request.getSession();
			httpsession.invalidate();
			String root = request.getHeader("Host") + request.getContextPath();
			response.sendRedirect("http://" + root + "/index.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
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
					response.sendError(401);
				}
				JDBC.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (cm.equals("logout")) {
			HttpSession httpsession = request.getSession();
			httpsession.invalidate();
			String root = request.getHeader("Host") + request.getContextPath();
			response.sendRedirect("http://" + root + "/index.jsp");
		} else if (cm.equals("regist")) {
			try {
				String uName = request.getParameter("uName");
				if(uName.trim().equals("")){
					out.println("不要修改网页代码\n请好好输入用户名");
				}else{
					String passwd = MD5Util.string2MD5(request.getParameter("passwd"));
					String passwd2 = MD5Util.string2MD5(request.getParameter("passwd2"));
					String email = request.getParameter("email");
					if (passwd.equals(passwd2)) {
						if (getUser(uName).next()) {
							out.print("已存在同名用户,请换一个用户名");
						} else {
							JDBCUtils JDBC = new JDBCUtils();
							PreparedStatement ps = JDBC.getPST(
									"INSERT INTO `n_blog`.`user` (`userName`, `passwd`, `email`) VALUES (?, ?, ?);");
							ps.setString(1, uName);
							ps.setString(2, passwd);
							ps.setString(3, email);
							int i = ps.executeUpdate();
							if (i != 1) {
								out.println("出现严重错误\n请练习管理员检查数据库");
							} else {
								out.println("注册成功");
							}
						}
					} else {
						out.println("不要修改网页代码\n两次密码不一致");
					}
				}
			} catch (Exception e) {
				response.sendError(500);
			}
		}
	}

	public ResultSet getUser(String uName) throws SQLException {
		JDBCUtils JDBC = new JDBCUtils();
		PreparedStatement ps = JDBC.getPST("select * from user where userName=?");
		ps.setString(1, uName);
		return ps.executeQuery();
	}

}
