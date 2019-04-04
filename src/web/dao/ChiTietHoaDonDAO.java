package web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.model.ChiTietHoaDon;
import web.model.HoaDon;

public class ChiTietHoaDonDAO {

	public static void themChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		String sql = "INSERT INTO chitiethoadon(id_hoadon,masanpham,giasanpham,soluong) VALUES(?,?,?,?)";
		Connection connection = JDBCConnection.myConnect();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setLong(1, chiTietHoaDon.getId_HoaDon());
			preparedStatement.setInt(2, chiTietHoaDon.getMaSanPham());
			preparedStatement.setDouble(3, chiTietHoaDon.getGiaSanPham());
			preparedStatement.setInt(4, chiTietHoaDon.getSoLuong());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static ArrayList<ChiTietHoaDon> getListChiTietHoaDon (long idHoaDon){
		ArrayList<ChiTietHoaDon> listHD = new ArrayList<>();
		Connection connection = JDBCConnection.myConnect();
		String sql = "SELECT * FROM chitiethoadon WHERE id_hoadon=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setLong(1, idHoaDon);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
				chiTietHoaDon.setId_chiTietHD(resultSet.getInt(1));
				chiTietHoaDon.setId_HoaDon(resultSet.getLong(2));
				chiTietHoaDon.setMaSanPham(resultSet.getInt(3));
				chiTietHoaDon.setGiaSanPham(resultSet.getDouble(4));
				chiTietHoaDon.setSoLuong(resultSet.getInt(5));
				listHD.add(chiTietHoaDon);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listHD;
	}
	
//	public static void main(String[] args) {
//		System.out.println(ChiTietHoaDonDAO.getListChiTietHoaDon(1554314365568L).size());
//	}
}
