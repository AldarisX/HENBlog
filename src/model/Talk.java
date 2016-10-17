package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.Config;
import com.JDBCUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Talk {
	private ArrayList<HashMap<String, String>> talks = new ArrayList<HashMap<String, String>>();
	private HashMap<String, String> talkInfo = new HashMap<String, String>();
	private int talksCount = 0;

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	public void add(String uName, String content) {
		HashMap<String, String> contents = new HashMap<String, String>();

		contents.put("uName", uName);
		contents.put("content", content);
		talks.add(contents);
	}

	public void addTalk(int tid, String uName, String content) {
		try {
			JDBCUtils JDBC = new JDBCUtils();
			PreparedStatement ps = JDBC
					.getPST("INSERT INTO `n_blog`.`talk` (`tid`, `userName`, `content`) VALUES (?, ?, ?);");
			ps.setInt(1, tid);
			ps.setString(2, uName);
			ps.setString(3, content);

			JDBC.getUpdate(ps);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void getTalks(int tid) {
		try {
			JDBCUtils JDBC = new JDBCUtils();
			PreparedStatement ps = JDBC.getPST("select * from talk where tid=?");
			ps.setInt(1, tid);
			ResultSet rs = JDBC.getQuery(ps);

			while (rs.next()) {
				add(rs.getString("userName"), rs.getString("content"));
				talksCount++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String getJson(int tid) {
		if (talks.size() == 0) {
			getTalks(tid);
		}
		talkInfo.put("maxCount", talksCount + "");

		JSONObject jobj = JSONObject.fromObject(talkInfo);
		JSONArray jarr = JSONArray.fromObject(talks);
		jobj.put("talks", jarr);
		return jobj.toString();
	}

}
