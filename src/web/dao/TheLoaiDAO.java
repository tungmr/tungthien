package web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import web.model.TheLoai;

public class TheLoaiDAO {

	public static TheLoai getMotTheLoai(int idTheLoai) {
		TheLoai theLoai = new TheLoai();
		Connection connection = JDBCConnection.myConnect();
		String sql = "SELECT * FROM theloai WHERE id_theloai=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, idTheLoai);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				theLoai.setiD(resultSet.getInt("id_theloai"));
				theLoai.setTenTheLoai(resultSet.getString("ten"));
				theLoai.setDanhMuc(resultSet.getInt("danhmuc"));
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return theLoai;
	}
	
	public static List<TheLoai> getTheLoai() {
		List<TheLoai> listTheLoai = new ArrayList<TheLoai>();

		Connection connection = JDBCConnection.myConnect();

		String sql = "SELECT * FROM theloai";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				TheLoai sanPham = new TheLoai();
				sanPham.setiD(resultSet.getInt("id_theloai"));
				sanPham.setTenTheLoai(resultSet.getString("ten"));
				sanPham.setDanhMuc(resultSet.getInt("danhmuc"));

				listTheLoai.add(sanPham);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return listTheLoai;
	}

	// Thêm thể loại
	public static boolean themTheLoai(int idDanhMuc, String tenTheLoai) {
		String sql = "INSERT INTO theloai(ten,danhmuc) VALUES(?,?)";
		Connection connection = JDBCConnection.myConnect();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, tenTheLoai);
			preparedStatement.setInt(2, idDanhMuc);

			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Sửa thể loại
	public static boolean suaTheLoai(int idTheLoai, int idDanhMuc, String tenTheLoai) {
		String sql = "UPDATE theloai SET ten=?, danhmuc=? WHERE id_theloai=?";
		Connection connection = JDBCConnection.myConnect();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, tenTheLoai);
			preparedStatement.setInt(2, idDanhMuc);
			preparedStatement.setInt(3, idTheLoai);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	// Xóa thể loại
	public static boolean xoaTheLoai(int idTheLoai) {
		String sql = "DELETE FROM theloai WHERE id_theloai=?";
		Connection connection = JDBCConnection.myConnect();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, idTheLoai);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static void main(String[] args) {
		/*if (TheLoaiDAO.themTheLoai(1, "Tung dai ca")) {
			System.out.println("OK");
		};*/
		
		/*if (TheLoaiDAO.suaTheLoai(27, 2, "TUNGMR")) {
			System.out.println("OK");
		}*/
		
		/*if (TheLoaiDAO.xoaTheLoai(27)) {
			System.out.println("OK");
		}*/
		/*TheLoai theLoai = TheLoaiDAO.getMotTheLoai(2);
		System.out.println(theLoai.getDanhMuc()+"  - "+ theLoai.getTenTheLoai());*/
	}
	
	
}
