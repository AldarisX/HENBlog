package servlet;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URLDecoder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.Config;
import com.JDBCUtils;

import model.GetInstall;
import net.sf.json.JSONObject;
import tool.Tool;

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
		System.out.println("开始获取获取项目路径");
		try {
			Config.warLoc = (config.getServletContext().getResource("/")).toString();
			String osName = System.getProperty("os.name");
			if (osName.toLowerCase().contains("windows")) {
				osName = "Windows";
			} else if (osName.toLowerCase().contains("linux")) {
				osName = "Linux";
			}
			switch (osName) {
			case "Linux":
				Config.warLoc = URLDecoder.decode(Config.warLoc.replace("file:", ""), "utf-8");
				break;
			case "Windows":
				Config.warLoc = URLDecoder.decode(Config.warLoc.replace("file:/", ""), "utf-8");
				break;
			}
			System.out.println("获取项目路径成功:" + Config.warLoc);
		} catch (MalformedURLException | UnsupportedEncodingException e) {
			System.err.println("获取项目路径失败");
			e.printStackTrace();
		}

		System.out.println("配置数据库属性");
		File dbJson = new File(Config.warLoc + "/WEB-INF/classes/db.json");
		Scanner scanner = null;
		StringBuilder jsonBuffer = new StringBuilder();
		try {
			scanner = new Scanner(dbJson, "utf-8");
			while (scanner.hasNextLine()) {
				jsonBuffer.append(scanner.nextLine());
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.err.println("找不到数据库配置文件!!!");
		} finally {
			if (scanner != null) {
				scanner.close();
			}
		}
		JSONObject dbOBJ = JSONObject.fromObject(jsonBuffer.toString());
		JDBCUtils.url = dbOBJ.getString("url");
		JDBCUtils.dbName = dbOBJ.getString("dbName");
		JDBCUtils.driver = dbOBJ.getString("driver");
		JDBCUtils.user = dbOBJ.getString("user");
		JDBCUtils.passwd = dbOBJ.getString("passwd");

		try {
			System.out.println("清空缓存");
			Tool.dirClean(new File(Config.warLoc + "/vmsp/"), true);

			System.out.println("设置博客属性");
			Config.bName = readOption("bname");
			Config.sex = readOption("sex");
			Config.birthday = readOption("birthday");
			Config.job = readOption("Job");
			Config.loc = readOption("Loc");
			Config.desc = readOption("desc");
			Config.background = readOption("background");

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

			System.out.println("加载允许的图片类型");
			JDBC = new JDBCUtils();
			ps = JDBC.getPST("select name from imagetype");
			rs = JDBC.getQuery(ps);
			while (rs.next()) {
				Tool.imgTypeList.add(rs.getString("name"));
			}
			JDBC.close();
			Tool.cacImgUL();
			System.out.println(Tool.imgUL);

			Config.isInstall = true;
			System.out.println("加载完成");
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("发现没有安装,即将进入安装");
			Config.isInstall = false;
		}
		GetInstall.jspIndex(Config.isInstall);
	}

	public void initx() {

	}

	public String readOption(String type) throws SQLException {
		JDBCUtils JDBC = new JDBCUtils();
		ResultSet rs = JDBC.getQuery("select * from `option` where type='" + type + "';");
		rs.next();
		return rs.getString("value");
	}

}
