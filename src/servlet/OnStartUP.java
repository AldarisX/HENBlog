package servlet;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.Config;
import com.JDBCUtils;

/**
 * Servlet implementation class OnStartUP
 */
@WebServlet("/OnStartUP")
public class OnStartUP extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OnStartUP() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			Config.bName = readOption("bname");
			Config.sex = readOption("sex");
			Config.birthday = readOption("birthday");
			Config.job = readOption("Job");
			Config.loc = readOption("Loc");
			Config.desc = readOption("desc");

			JDBCUtils JDBC = new JDBCUtils();
			ResultSet rs = JDBC.getQuery("select * from head order by sindex");
			while (rs.next()) {
				Config.headName.add(rs.getString("name"));
				Config.headLink.add(rs.getString("link"));
			}

			JDBC = new JDBCUtils("information_schema");
			PreparedStatement ps = JDBC
					.getPST("select TABLE_ROWS from tables where TABLE_NAME='titles' and TABLE_SCHEMA='n_blog';");
			rs = JDBC.getQuery(ps);

			rs.next();
			Config.titleCount = rs.getInt("TABLE_ROWS");

			JDBC.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String readOption(String type) {
		JDBCUtils JDBC = null;
		try {
			JDBC = new JDBCUtils();
			ResultSet rs = JDBC.getQuery("select * from `option` where type='" + type + "';");
			rs.next();
			return rs.getString("value");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBC.close();
		return "";
	}

}
