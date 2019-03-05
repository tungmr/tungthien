package web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCConnection {
	public static final String url = "jdbc:mysql://localhost:3306/doanweb?autoReconnect=true&useSSL=false";
	public static final String user = "root";
	public static final String password = "123456";

	public static Connection myConnect() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			if (conn != null) {
				System.out.println("Da ket noi thanh cong");
			}
		} catch (ClassNotFoundException ex) {
			System.out.print("Ko load dc driver!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void main(String[] args) {
		JDBCConnection c = new JDBCConnection();
		Connection conn = c.myConnect();
	}
}