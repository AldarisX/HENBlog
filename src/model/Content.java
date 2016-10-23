package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import com.JDBCUtils;

import net.sf.json.JSONObject;

public class Content {

	private HashMap<String, String> cont = new HashMap<String, String>();

	public void addContent(String user, String title, String pretitle, String content) {
		try {
			JDBCUtils JDBC = new JDBCUtils();
			PreparedStatement ps = JDBC.getPST(
					"INSERT INTO `n_blog`.`titles` (`user`, `title`, `pretitle`, `content`) VALUES (?, ?, ?, ?);");
			ps.setString(1, user);
			ps.setString(2, title);
			ps.setString(3, pretitle);
			ps.setString(4, content);

			JDBC.getUpdate(ps);
			JDBC.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void delContent(int id) {
		try {
			JDBCUtils JDBC = new JDBCUtils();
			PreparedStatement ps = JDBC.getPST("DELETE FROM `n_blog`.`titles` WHERE `id`=?;");
			ps.setInt(1, id);
			JDBC.getUpdate(ps);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateContent(int id, String title, String pretitle, String content) {
		try {
			JDBCUtils JDBC = new JDBCUtils();
			PreparedStatement ps = JDBC
					.getPST("UPDATE `n_blog`.`titles` SET `title`=?, `pretitle`=?, `content`=? WHERE `id`=?;");
			ps.setString(1, title);
			ps.setString(2, pretitle);
			ps.setString(3, content);
			ps.setInt(4, id);

			JDBC.getUpdate(ps);
			JDBC.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void getContent(int id) {
		JDBCUtils JDBC;
		try {
			JDBC = new JDBCUtils();

			ResultSet rs = JDBC.getQuery("select * from titles where id=" + id);

			if (rs.next()) {

				cont.put("id", rs.getInt("id") + "");
				cont.put("user", rs.getString("user"));
				cont.put("title", rs.getString("title"));
				cont.put("pretitle", rs.getString("pretitle"));
				cont.put("content", rs.getString("content"));
				cont.put("date", rs.getString("date"));

				JDBC.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String getJson(int id) throws SQLException {
		if (cont.size() == 0) {
			getContent(id);
		}
		JSONObject jobj = JSONObject.fromObject(cont);
		return jobj.toString();
	}

}
