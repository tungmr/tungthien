package web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import web.model.SanPham;

public class Search {

	public static List<SanPham> getSanPhamByName(String name) {
		
		List<SanPham> listSP = new ArrayList<SanPham>();
		Connection connection = JDBCConnection.myConnect();
		String sql = "SELECT * FROM sanpham WHERE tensanpham like '%"+name+"%'";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				SanPham sanPham = new SanPham();
				sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
				sanPham.setTheLoai(resultSet.getInt("theloai"));
				sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
				sanPham.setTenSanPham(resultSet.getString("tensanpham"));
				sanPham.setAnhSanPham(resultSet.getString("anhsanpham"));
				sanPham.setGiaSanPham(resultSet.getDouble("giasanpham"));
				sanPham.setMoTaSanPham(resultSet.getString("motasanpham"));
				listSP.add(sanPham);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return listSP;
	}
	
	public static List<SanPham> getSanPhamByPrice(double a, double b){
		List<SanPham> listSP = new ArrayList<SanPham>();
		String sql = "SELECT * FROM sanpham WHERE giasanpham > "+a+"and giasanpham <"+b;
		Connection connection = JDBCConnection.myConnect();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				SanPham sanPham = new SanPham();
				sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
				sanPham.setTheLoai(resultSet.getInt("theloai"));
				sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
				sanPham.setTenSanPham(resultSet.getString("tensanpham"));
				sanPham.setAnhSanPham(resultSet.getString("anhsanpham"));
				sanPham.setGiaSanPham(resultSet.getDouble("giasanpham"));
				sanPham.setMoTaSanPham(resultSet.getString("motasanpham"));
				listSP.add(sanPham);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listSP;
	}
	
	/*public static void main(String[] args) {
		List<SanPham> listSP = Search.getSanPhamByName("ví");
		if (listSP.size()==0) {
			System.out.println("Không có sản phẩm nào để hiển thị");
		}
		else
		for ( SanPham sanPham : listSP) {
			System.out.println(sanPham.getTenSanPham());
		}
		
	}*/
	
	/*public static void main(String[] args) {
		List<SanPham> listSP = Search.getSanPhamByPrice(10, 100);
		if (listSP.size()==0) {
			System.out.println("Không có sản phẩm nào để hiển thị");
		}
		else
		for ( SanPham sanPham : listSP) {
			System.out.println(sanPham.getTenSanPham() + " - " + sanPham.getGiaSanPham());
		}
	}*/
}
