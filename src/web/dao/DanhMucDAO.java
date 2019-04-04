package web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import web.model.DanhMuc;

public class DanhMucDAO {

	public static List<DanhMuc> getDanhMuc() {
		List<DanhMuc> listDanhMuc = new ArrayList<DanhMuc>();

		Connection connection = JDBCConnection.myConnect();

		String sql = "SELECT * FROM danhmuc";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				DanhMuc danhMuc = new DanhMuc();
				danhMuc.setiD(resultSet.getInt("id_danhmuc"));
				danhMuc.setTenDanhMuc(resultSet.getString("ten"));
				listDanhMuc.add(danhMuc);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return listDanhMuc;
	}

	public static DanhMuc getMotDanhMuc(int idDanhMuc) {
		DanhMuc danhMuc = new DanhMuc();
		Connection connection = JDBCConnection.myConnect();

		String sql = "SELECT * FROM danhmuc WHERE id_danhmuc=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, idDanhMuc);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				danhMuc.setiD(resultSet.getInt("id_danhmuc"));
				danhMuc.setTenDanhMuc(resultSet.getString("ten"));
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return danhMuc;
	}

}
