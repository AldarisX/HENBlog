package model;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.JDBCUtils;

public class User {
	private String userName = "";
	private String passwd = "";
	private String email = "";
	private int level = 6;

	public User() {
	}

	public User(String userName, String passwd) {
		this.userName = userName;
		this.passwd = passwd;
	}

	public User(String userName, String passwd, String email) {
		this.userName = userName;
		this.passwd = passwd;
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int addUser() throws SQLException {
		JDBCUtils JDBC = new JDBCUtils();
		PreparedStatement ps = JDBC
				.getPST("INSERT INTO `n_blog`.`user` (`userName`, `passwd`, `email`) VALUES (?, ?, ?);");
		ps.setString(1, userName);
		ps.setString(2, passwd);
		ps.setString(3, email);
		return JDBC.getUpdate(ps);
	}
}
