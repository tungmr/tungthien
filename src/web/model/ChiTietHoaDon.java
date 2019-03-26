package web.model;

public class ChiTietHoaDon {

	private int id_chiTietHD;
	private int id_HoaDon;
	private int maSanPham;
	private double giaSanPham;
	private int soLuong;
	
	public ChiTietHoaDon() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChiTietHoaDon(int id_chiTietHD, int id_HoaDon, int maSanPham, double giaSanPham, int soLuong) {
		super();
		this.id_chiTietHD = id_chiTietHD;
		this.id_HoaDon = id_HoaDon;
		this.maSanPham = maSanPham;
		this.giaSanPham = giaSanPham;
		this.soLuong = soLuong;
	}
	public int getId_chiTietHD() {
		return id_chiTietHD;
	}
	public void setId_chiTietHD(int id_chiTietHD) {
		this.id_chiTietHD = id_chiTietHD;
	}
	public int getId_HoaDon() {
		return id_HoaDon;
	}
	public void setId_HoaDon(int id_HoaDon) {
		this.id_HoaDon = id_HoaDon;
	}
	public int getMaSanPham() {
		return maSanPham;
	}
	public void setMaSanPham(int maSanPham) {
		this.maSanPham = maSanPham;
	}
	public double getGiaSanPham() {
		return giaSanPham;
	}
	public void setGiaSanPham(double giaSanPham) {
		this.giaSanPham = giaSanPham;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	
}
