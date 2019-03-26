package web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import web.model.User;

public class UserDAO {

	
		// kiểm tra username đã tồn tại????
	public static boolean checkUser(String username) {
		
		Connection connection = JDBCConnection.myConnect();
		
		String sql = "SELECT * FROM user WHERE username='"+username+ "'";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				connection.close();
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;
	}
	
	// kiểm tra email đã tồn tại????
	public static boolean checkEmail(String email) {
		
		Connection connection = JDBCConnection.myConnect();
		
		String sql = "SELECT * FROM user WHERE email='"+email+ "'";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				connection.close();
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;
	}
	
	
	public static boolean insertUser(User user) {
		Connection connection = JDBCConnection.myConnect();
		String sql = "INSERT INTO user(username,password,email,phonenumber,role) VALUES(?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUserName());
			preparedStatement.setString(2, user.getPasswordUser());
			preparedStatement.setString(3, user.getEmailUser());
			preparedStatement.setString(4, user.getPhoneNumberUser());
			preparedStatement.setInt(5, 0);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	
	public static boolean checkUserLogin(String username, String password) {
		
		Connection connection = JDBCConnection.myConnect();
		String sql = "SELECT * FROM user WHERE username='"+username+"' and password='"+password+"'";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public static User getUser(String username) {
		User user = new User();
		Connection connection =  JDBCConnection.myConnect();
		String sql = "SELECT *FROM user WHERE username='"+username+"'";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user.setIdUser(resultSet.getInt("id_user"));
				user.setUserName(resultSet.getString("username"));
				user.setPasswordUser(resultSet.getString("password"));
				user.setEmailUser(resultSet.getString("email"));
				user.setPhoneNumberUser(resultSet.getString("phonenumber"));
				user.setRoleUser(resultSet.getInt("role"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return user;
	}
}
