package web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import web.model.ChiTietHoaDon;

public class ChiTietHoaDonDAO {

	public static void themChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		String sql = "INSERT INTO chitiethoadon(id_hoadon,masanpham,giasanpham,soluong) VALUES(?,?,?,?)";
		Connection connection = JDBCConnection.myConnect();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, chiTietHoaDon.getId_HoaDon());
			preparedStatement.setInt(2, chiTietHoaDon.getMaSanPham());
			preparedStatement.setDouble(3, chiTietHoaDon.getGiaSanPham());
			preparedStatement.setInt(4, chiTietHoaDon.getSoLuong());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	/*public static void main(String[] args) {
		ChiTietHoaDonDAO.themChiTietHoaDon(new ChiTietHoaDon(0,2,3,5500,2));
	}*/
}
