package model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.Config;
import com.JDBCUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Titles {

	private ArrayList<HashMap<String, String>> titles = new ArrayList<HashMap<String, String>>();
	private HashMap<String, String> titleInfo = new HashMap<String, String>();

	public void addTitle(int id, String title, String preTitle, String user, Date date) {
		HashMap<String, String> contents = new HashMap<String, String>();

		contents.put("id", id + "");
		contents.put("user", user);
		contents.put("title", title);
		contents.put("pre", preTitle);
		titles.add(contents);
	}

	public void getTitle(int index) {
		try {
			int start = (index - 1) * Config.logCount;
			JDBCUtils JDBC = new JDBCUtils();
			PreparedStatement ps = JDBC
					.getPST("select * from titles order by date desc limit " + start + "," + Config.logCount);
			ResultSet rs = JDBC.getQuery(ps);

			while (rs.next()) {
				addTitle(rs.getInt("id"), rs.getString("title"), rs.getString("pretitle"), rs.getString("user"),
						rs.getDate("date"));
			}
			JDBC.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String getJson(int index) {
		if (titles.size() == 0) {
			getTitle(index);
		}
		titleInfo.put("maxCount", Config.titleCount + "");

		JSONObject jobj = JSONObject.fromObject(titleInfo);
		JSONArray jarr = JSONArray.fromObject(titles);
		jobj.put("titles", jarr);
		return jobj.toString();
	}

	public String SearchAll(String key) {
		try {
			key = "%" + key + "%";
			JDBCUtils JDBC = new JDBCUtils();
			PreparedStatement ps = JDBC
					.getPST("select * from titles where title like ? or pretitle like ? order by date desc limit 15;");
			ps.setString(1, key);
			ps.setString(2, key);
			ResultSet rs = JDBC.getQuery(ps);

			while (rs.next()) {
				addTitle(rs.getInt("id"), rs.getString("title"), rs.getString("pretitle"), rs.getString("user"),
						rs.getDate("date"));
			}

			ps = JDBC.getPST("SELECT COUNT(*) FROM titles WHERE title like ? or pretitle like ?;");
			ps.setString(1, key);
			ps.setString(2, key);
			rs = JDBC.getQuery(ps);
			rs.next();
			titleInfo.put("maxCount", rs.getInt(1) + "");

			JDBC.close();

			JSONObject jobj = JSONObject.fromObject(titleInfo);
			JSONArray jarr = JSONArray.fromObject(titles);
			jobj.put("titles", jarr);
			return jobj.toString();
		} catch (SQLException e) {
			e.printStackTrace();
			return "";
		}
	}

}
