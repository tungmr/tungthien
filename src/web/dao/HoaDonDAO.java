package web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import web.model.HoaDon;

public class HoaDonDAO {

	public static void themHoaDon(HoaDon hoaDon) {
		Connection connection = JDBCConnection.myConnect();
		String sql= "INSERT INTO hoadon VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, hoaDon.getId_hoaDon());
			preparedStatement.setInt(2, hoaDon.getId_user());
			preparedStatement.setDouble(3, hoaDon.getTongTien());
			preparedStatement.setString(4, hoaDon.getPhuongThucThanhToan());
			preparedStatement.setString(5, hoaDon.getDiaChi());
			preparedStatement.setTimestamp(6, hoaDon.getDate());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	/*public static void main(String[] args) {
		HoaDonDAO.themHoaDon(new HoaDon(5,6,5500,"trực tiếp","man thiện", new Date(2018, 8, 25)));
	}*/
}
