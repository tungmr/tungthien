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
				sanPham.setSoLuong(resultSet.getInt("soluong"));
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
				sanPham.setSoLuong(resultSet.getInt("soluong"));

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
				sanPham.setSoLuong(resultSet.getInt("soluong"));

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
				sanPham.setSoLuong(resultSet.getInt("soluong"));

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
					sanPham.setSoLuong(resultSet.getInt("soluong"));

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
					sanPham.setSoLuong(resultSet.getInt("soluong"));

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
					sanPham.setSoLuong(resultSet.getInt("soluong"));

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
					sanPham.setSoLuong(resultSet.getInt("soluong"));

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
					sanPham.setSoLuong(resultSet.getInt("soluong"));

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
					sanPham.setSoLuong(resultSet.getInt("soluong"));

					listSP.add(sanPham);
				}
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return listSP;
		}
		
		public static boolean themSanPham(SanPham sanPham) {
			String sql = "INSERT INTO sanpham(theloai,danhmuc,tensanpham,anhsanpham,giasanpham,motasanpham,soluong) VALUES(?,?,?,?,?,?,?)";
			Connection connection = JDBCConnection.myConnect();
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, sanPham.getTheLoai());
				preparedStatement.setInt(2, sanPham.getDanhMuc());
				preparedStatement.setString(3, sanPham.getTenSanPham());
				preparedStatement.setString(4, sanPham.getAnhSanPham());
				preparedStatement.setDouble(5, sanPham.getGiaSanPham());
				preparedStatement.setString(6, sanPham.getMoTaSanPham());
				preparedStatement.setInt(7, sanPham.getSoLuong());
				return preparedStatement.executeUpdate() ==1;
			} catch (Exception e) {
				// TODO: handle exception
			}
			return false;
		}
		
		public static ArrayList<SanPham> getListSanPhamMoi (){
			Connection connection = JDBCConnection.myConnect();
			String sql = "SELECT * FROM sanpham order by id_sanpham desc LIMIT 3";
			ArrayList<SanPham> listSP = new ArrayList<>();
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
					sanPham.setSoLuong(resultSet.getInt("soluong"));

					listSP.add(sanPham);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return listSP;
		}
		public static ArrayList<SanPham> getListSanPhamNoiBat(){
			Connection connection = JDBCConnection.myConnect();
			String sql = "SELECT * FROM sanpham ORDER BY RAND() LIMIT 3";
			ArrayList<SanPham> listSP = new ArrayList<>();
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
					sanPham.setSoLuong(resultSet.getInt("soluong"));

					listSP.add(sanPham);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return listSP;
		}
		
		public static boolean truSoLuongSanPham(int idSanPham, int soLuong) {
			SanPham sanPham = SanPhamDAO.getSanPhamByIdSanPham(idSanPham);
			int soLuongMoi = sanPham.getSoLuong() - soLuong;
			String sql = "UPDATE sanpham SET soluong=? WHERE id_sanpham=?" ;
			Connection connection = JDBCConnection.myConnect();
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, soLuongMoi);
				preparedStatement.setInt(2, idSanPham);
				return preparedStatement.executeUpdate()==1;
			} catch (Exception e) {
				// TODO: handle exception
			}
			return false;
			
		}
		
		public static int getSoLuongMotSanPham(int idSanPham) {
			String sql = "SELECT soluong FROM sanpham WHERE id_sanpham=?";
			Connection connection = JDBCConnection.myConnect();
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, idSanPham);
				ResultSet resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					return resultSet.getInt(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return 0;
		}
		
		public static boolean suaSanPham(SanPham sanPham, int idSanPham) {
			String sql = "UPDATE sanpham SET theloai=?, danhmuc=? , tensanpham=?, anhsanpham=?, giasanpham=?, motasanpham=?, soluong=? WHERE id_sanpham=?";
			Connection connection = JDBCConnection.myConnect();
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, sanPham.getTheLoai());
				preparedStatement.setInt(2, sanPham.getDanhMuc());
				preparedStatement.setString(3, sanPham.getTenSanPham());
				preparedStatement.setString(4, sanPham.getAnhSanPham());
				preparedStatement.setDouble(5, sanPham.getGiaSanPham());
				preparedStatement.setString(6, sanPham.getMoTaSanPham());
				preparedStatement.setInt(7, sanPham.getSoLuong());
				preparedStatement.setInt(8, idSanPham);
				return preparedStatement.executeUpdate() ==1;
			} catch (Exception e) {
				// TODO: handle exception
			}
			return false;
		}
		
		public static boolean xoaSanPham (int idSanPham) {
			String sql ="DELETE FROM sanpham WHERE id_sanpham=?";
			Connection connection = JDBCConnection.myConnect();
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, idSanPham);
				return preparedStatement.executeUpdate()==1;
			} catch (Exception e) {
				// TODO: handle exception
			}
			return false;
		}
		
		
		public static void main(String[] args) {
			//System.out.println(SanPhamDAO.getListSanPhamMoi().size());
			
			//System.out.println(SanPhamDAO.getSoLuongMotSanPham(4));
		}

}
