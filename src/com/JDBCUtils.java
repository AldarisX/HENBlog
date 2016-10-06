package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Timer;
import java.util.TimerTask;

public class JDBCUtils {
	public static String url = "jdbc:mysql://127.0.0.1/";
	public static String dbName = "n_blog";
	public static String driver = "com.mysql.jdbc.Driver";
	public static String user = "root";
	public static String passwd = "aldaris";

	public Connection conn = null;
	public Statement st = null;
	public PreparedStatement pst = null;
	public ResultSet rs = null;

	private Timer timer = new Timer();
	private int limit = 5;
	private int count = 0;

	public static void main(String[] args) {
		for (int i = 0; i < 1000; i++) {
			try {
				new JDBCUtils();
				System.out.println("建立了链接" + i);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e2) {
			e2.printStackTrace();
		}

		count = limit;
		timer.schedule(new TimerTask() {
			public void run() {
				if (count <= 0) {
					close();
				}
				count--;
			}
		}, 0, 1000);
	}

	public JDBCUtils() throws SQLException {
		boolean tryGetConn = true;
		try {
			while (tryGetConn) {
				conn = DriverManager.getConnection(url + dbName, user, passwd);
				tryGetConn = false;
			}
		} catch (com.mysql.jdbc.exceptions.jdbc4.MySQLNonTransientConnectionException e) {
			System.out.println("数据库链接不足 建议调整数据库链接");
			tryGetConn = true;
			try {
				Thread.sleep(10);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}
	}

	public JDBCUtils(String dbName) throws SQLException {
		boolean tryGetConn = true;
		try {
			while (tryGetConn) {
				conn = DriverManager.getConnection(url + dbName, user, passwd);
				tryGetConn = false;
			}
		} catch (com.mysql.jdbc.exceptions.jdbc4.MySQLNonTransientConnectionException e) {
			System.out.println("数据库链接不足 建议调整数据库链接");
			tryGetConn = true;
			try {
				Thread.sleep(10);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}
	}

	private Statement getST() throws SQLException {
		return conn.createStatement();
	}

	public PreparedStatement getPST(String sql) throws SQLException {
		return conn.prepareStatement(sql);
	}

	public ResultSet getQuery(String sql) throws SQLException {
		count = limit;
		return getST().executeQuery(sql);
	}

	public ResultSet getQuery(PreparedStatement ps) throws SQLException {
		count = limit;
		pst = ps;
		return ps.executeQuery();
	}

	public ResultSet getRS(String sql) {
		ResultSet rs = null;
		try {
			rs = getST().executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public int getUpdate(String sql) throws SQLException {
		count = limit;
		return getST().executeUpdate(sql);
	}

	public int getUpdate(PreparedStatement ps) throws SQLException {
		count = limit;
		pst = ps;
		return ps.executeUpdate();
	}

	public void close() {
		try {
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			st.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			pst.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}

		timer.cancel();
	}
}
