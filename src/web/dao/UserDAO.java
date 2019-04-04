package web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.model.User;

public class UserDAO {

	
		// kiểm tra username đã tồn tại????
	public static boolean checkUser(String username) {
		
		Connection connection = JDBCConnection.myConnect();
		
		String sql = "SELECT * FROM user WHERE username=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
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
		
		String sql = "SELECT * FROM user WHERE email=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, email);
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
		String sql = "SELECT * FROM user WHERE username=? and password=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
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
		String sql = "SELECT *FROM user WHERE username=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
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
	
	
	public static User getUserByID(int  idUser) {
		User user = new User();
		Connection connection =  JDBCConnection.myConnect();
		String sql = "SELECT *FROM user WHERE id_user=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, idUser);
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
	
	public static ArrayList<User> getListUser(){
		ArrayList<User> listUser = new ArrayList<>();
		Connection connection =  JDBCConnection.myConnect();
		String sql = "SELECT *FROM user";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				User user = new User();
				user.setIdUser(resultSet.getInt("id_user"));
				user.setUserName(resultSet.getString("username"));
				user.setEmailUser(resultSet.getString("email"));
				user.setPhoneNumberUser(resultSet.getString("phonenumber"));
				if (resultSet.getInt("role")==1)
					continue;
				listUser.add(user);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return listUser;
	}
}
