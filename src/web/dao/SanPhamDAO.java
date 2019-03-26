package web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import web.model.SanPham;

public class SanPhamDAO {

	// lấy danh sách sản phẩm theo id thể loại
	public static List<SanPham> getSanPhamByIdTheLoai(int idTheLoai) {
		List<SanPham> listSanPhamByTheLoai = new ArrayList<SanPham>();

		Connection connection = JDBCConnection.myConnect();

		String sql = "SELECT * FROM sanpham WHERE theloai='" + idTheLoai + "'";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				SanPham sanPham = new SanPham();
				sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
				sanPham.setTheLoai(resultSet.getInt("theloai"));
				sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
				sanPham.setTenSanPham(resultSet.getString("tensanpham"));
				sanPham.setAnhSanPham(resultSet.getString("anhsanpham"));
				sanPham.setGiaSanPham(resultSet.getDouble("giasanpham"));
				sanPham.setMoTaSanPham(resultSet.getString("motasanpham"));
				listSanPhamByTheLoai.add(sanPham);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return listSanPhamByTheLoai;
	}

	// lấy danh sách sản phẩm theo id danh muc
	public static List<SanPham> getSanPhamByIdDanhMuc(int idDanhMuc) {
		List<SanPham> listSanPhamByDanhMuc = new ArrayList<SanPham>();

		Connection connection = JDBCConnection.myConnect();

		String sql = "SELECT * FROM sanpham WHERE danhmuc='" + idDanhMuc + "'";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				SanPham sanPham = new SanPham();
				sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
				sanPham.setTheLoai(resultSet.getInt("theloai"));
				sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
				sanPham.setTenSanPham(resultSet.getString("tensanpham"));
				sanPham.setAnhSanPham(resultSet.getString("anhsanpham"));
				sanPham.setGiaSanPham(resultSet.getDouble("giasanpham"));
				sanPham.setMoTaSanPham(resultSet.getString("motasanpham"));
				listSanPhamByDanhMuc.add(sanPham);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listSanPhamByDanhMuc;
	}

	// get 1 sản phẩm theo id của sản phẩm
	public static SanPham getSanPhamByIdSanPham(int idSanPham) {
		SanPham sanPham = new SanPham();
		String sql = "SELECT * FROM sanpham WHERE id_sanpham='" + idSanPham + "'";
		Connection connection = JDBCConnection.myConnect();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
				sanPham.setTheLoai(resultSet.getInt("theloai"));
				sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
				sanPham.setTenSanPham(resultSet.getString("tensanpham"));
				sanPham.setAnhSanPham(resultSet.getString("anhsanpham"));
				sanPham.setGiaSanPham(resultSet.getDouble("giasanpham"));
				sanPham.setMoTaSanPham(resultSet.getString("motasanpham"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return sanPham;

	}
	
	// lấy ds sản phẩm theo danh mục để phân trang 
	public static ArrayList<SanPham> getListSanPhamByDanhMuc(int idDanhMuc, int result, int maxResult){
		ArrayList<SanPham> listSP = new ArrayList<>();
		Connection connection = JDBCConnection.myConnect();
		String sql = "SELECT * FROM sanpham WHERE danhmuc='"+idDanhMuc+"' limit ?,?";
		try {
			PreparedStatement preparedStatement = connection.prepareCall(sql);
			preparedStatement.setInt(1, result);
			preparedStatement.setInt(2, maxResult);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				SanPham sanPham = new SanPham();
				sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
				sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
				sanPham.setTheLoai(resultSet.getInt("theloai"));
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
	
	
	// đếm tổng sản phẩm theo danh mục
	public static int demTongSanPhamTheoDanhMuc(int danhMuc) {
		int count = 0;
		String sql = "SELECT count(id_sanpham) FROM sanpham WHERE danhmuc='"+danhMuc+"'";
		Connection connection = JDBCConnection.myConnect();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				count = resultSet.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return count;
	}
	
	// lấy ds sản phẩm theo thể loại để phân trang 
		public static ArrayList<SanPham> getListSanPhamByTheLoai(int idTheLoai, int result, int maxResult){
			ArrayList<SanPham> listSP = new ArrayList<>();
			Connection connection = JDBCConnection.myConnect();
			String sql = "SELECT * FROM sanpham WHERE theloai='"+idTheLoai+"' limit ?,?";
			try {
				PreparedStatement preparedStatement = connection.prepareCall(sql);
				preparedStatement.setInt(1, result);
				preparedStatement.setInt(2, maxResult);
				ResultSet resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					SanPham sanPham = new SanPham();
					sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
					sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
					sanPham.setTheLoai(resultSet.getInt("theloai"));
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
		
		
		// đếm tổng sản phẩm theo thể loại
		public static int demTongSanPhamTheoTheLoai(int idTheLoai) {
			int count = 0;
			String sql = "SELECT count(id_sanpham) FROM sanpham WHERE theloai='"+idTheLoai+"'";
			Connection connection = JDBCConnection.myConnect();
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					count = resultSet.getInt(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return count;
		}
		
		public static ArrayList<SanPham> locSanPhamThuocDanhMucTheoKhoangGia(int idDanhMuc, double min, double max){
			ArrayList<SanPham> listSP = new ArrayList<>();
			String sql = "SELECT * FROM sanpham WHERE danhmuc='"+idDanhMuc+"' and giasanpham >="+min+" and giasanpham <="+max;
			Connection connection = JDBCConnection.myConnect();
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					SanPham sanPham = new SanPham();
					sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
					sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
					sanPham.setTheLoai(resultSet.getInt("theloai"));
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
		
		public static ArrayList<SanPham> locSanPhamThuocDanhMucTheoKG(int idDanhMuc, double min){
			ArrayList<SanPham> listSP = new ArrayList<>();
			String sql = "SELECT * FROM sanpham WHERE danhmuc='"+idDanhMuc+"' and giasanpham >="+min;
			Connection connection = JDBCConnection.myConnect();
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					SanPham sanPham = new SanPham();
					sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
					sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
					sanPham.setTheLoai(resultSet.getInt("theloai"));
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
		
		public static ArrayList<SanPham> locSanPhamThuocTheLoaiTheoKhoangGia(int idTheLoai, double min, double max){
			ArrayList<SanPham> listSP = new ArrayList<>();
			String sql = "SELECT * FROM sanpham WHERE theloai='"+idTheLoai+"' and giasanpham >="+min+" and giasanpham <="+max;
			Connection connection = JDBCConnection.myConnect();
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					SanPham sanPham = new SanPham();
					sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
					sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
					sanPham.setTheLoai(resultSet.getInt("theloai"));
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
		
		public static ArrayList<SanPham> locSanPhamThuocTheLoaiTheoKG(int idTheLoai, double min){
			ArrayList<SanPham> listSP = new ArrayList<>();
			String sql = "SELECT * FROM sanpham WHERE theloai='"+idTheLoai+"' and giasanpham >="+min;
			Connection connection = JDBCConnection.myConnect();
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					SanPham sanPham = new SanPham();
					sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
					sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
					sanPham.setTheLoai(resultSet.getInt("theloai"));
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
		
		public static ArrayList<SanPham> getListSanPham(){
			ArrayList<SanPham> listSP = new ArrayList<>();
			String sql= "SELECT * FROM sanpham";
			Connection connection = JDBCConnection.myConnect();
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					SanPham sanPham = new SanPham();
					sanPham.setIdSanPham(resultSet.getInt("id_sanpham"));
					sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
					sanPham.setTheLoai(resultSet.getInt("theloai"));
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
		ArrayList<SanPham> listSP = SanPhamDAO.getListSanPham();
		System.out.println(listSP.size());
	}*/

}
