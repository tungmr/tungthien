package web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.model.HoaDon;

public class HoaDonDAO {

	public static void themHoaDon(HoaDon hoaDon) {
		Connection connection = JDBCConnection.myConnect();
		String sql= "INSERT INTO hoadon VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setLong(1, hoaDon.getId_hoaDon());
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
	
	public static ArrayList<HoaDon> getListHoaDon(){
		ArrayList<HoaDon> listHD = new ArrayList<>();
		Connection connection = JDBCConnection.myConnect();
		String sql ="SELECT * FROM hoadon";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				HoaDon hoaDon = new HoaDon();
				hoaDon.setId_hoaDon(resultSet.getLong(1));
				hoaDon.setId_user(resultSet.getInt(2));
				hoaDon.setTongTien(resultSet.getDouble(3));
				hoaDon.setPhuongThucThanhToan(resultSet.getString(4));
				hoaDon.setDiaChi(resultSet.getString(5));
				hoaDon.setDate(resultSet.getTimestamp(6));
				listHD.add(hoaDon);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listHD;
	}
	
	public static HoaDon getListHoaDonByID(long idHoaDon){
		HoaDon hoaDon = new HoaDon();
		Connection connection = JDBCConnection.myConnect();
		String sql ="SELECT * FROM hoadon WHERE id_hoadon=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setLong(1, idHoaDon);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				hoaDon.setId_hoaDon(resultSet.getLong(1));
				hoaDon.setId_user(resultSet.getInt(2));
				hoaDon.setTongTien(resultSet.getDouble(3));
				hoaDon.setPhuongThucThanhToan(resultSet.getString(4));
				hoaDon.setDiaChi(resultSet.getString(5));
				hoaDon.setDate(resultSet.getTimestamp(6));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return hoaDon;
	}
	
	/*public static void main(String[] args) {
		HoaDonDAO.themHoaDon(new HoaDon(5,6,5500,"trực tiếp","man thiện", new Date(2018, 8, 25)));
	}*/
	
	public static void main(String[] args) {
		//System.out.println(HoaDonDAO.getListHoaDon().size());
	}
}
