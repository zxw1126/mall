package com.zxw.myMall.common.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

public class JDBCUtil {

	private static ResourceBundle rb = ResourceBundle.getBundle("/myMall/src/main/resources/jdbc");
	private static String driver = rb.getString("driver");
	private static String url = "jdbc:mysql://127.0.0.1:3306/mall?useSSL=false&useUnicode=true&characterEncoding=UTF-8&allowPublicKeyRetrieval=true&serverTimezone=Hongkong";
	private static String user = "root", password = "root";

	
	static {
		try {
			Class.forName(driver);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();

		}

	}

	public static Connection getConnection() throws SQLException {
		Connection con = DriverManager.getConnection(url, user, password);
		return con;
	}

	public static void close(Connection conn, Statement st, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (st != null) {
				st.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(Connection connection, PreparedStatement statement){
		close(connection, statement,null);
	}

	public static void main(String[] args) throws SQLException {
		Connection con = JDBCUtil.getConnection();
		System.out.println(con);
		con.close();
	}

	private JDBCUtil() {
		
	}
}
