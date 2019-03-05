package web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import web.model.SanPham;

public class GetSanPham {

	public List<SanPham> getSanPhamByIdTheLoai(int idTheLoai){
		List<SanPham> listSanPhamByTheLoai = new ArrayList<SanPham>();
		
		Connection connection = JDBCConnection.myConnect();
		
		String sql = "SELECT * FROM sanpham WHERE theloai='"+ idTheLoai +"'";
		try {
			SanPham sanPham = new SanPham();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
			sanPham.setTheLoai(resultSet.getInt("theloai"));
			sanPham.setTenSanPham(resultSet.getString("tensanpham"));
			sanPham.setAnhSanPham(resultSet.getString("tensanpham"));
			sanPham.setGiaSanPham(resultSet.getDouble("giasanpham"));
			sanPham.setMoTaSanPham(resultSet.getString("tensanpham"));
			
			listSanPhamByTheLoai.add(sanPham);			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listSanPhamByTheLoai;
	}
	
	public static void main(String[] args) {
		// thêm sản phẩm vào và thử xem ra ko
	}
}
