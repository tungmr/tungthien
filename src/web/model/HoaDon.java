package web.model;

import java.sql.Timestamp;

public class HoaDon {

	private long id_hoaDon;
	private int id_user;
	private double tongTien;
	private String phuongThucThanhToan;
	private String diaChi;
	private Timestamp ngay;
	
	public HoaDon(long id_hoaDon, int id_user, double tongTien, String phuongThucThanhToan, String diaChi,
			Timestamp ngay) {
		super();
		this.id_hoaDon = id_hoaDon;
		this.id_user = id_user;
		this.tongTien = tongTien;
		this.phuongThucThanhToan = phuongThucThanhToan;
		this.diaChi = diaChi;
		this.ngay = ngay;
	}
	public HoaDon() {
		super();
		// TODO Auto-generated constructor stub
	}
	public long getId_hoaDon() {
		return id_hoaDon;
	}
	public void setId_hoaDon(long id_hoaDon) {
		this.id_hoaDon = id_hoaDon;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public double getTongTien() {
		return tongTien;
	}
	public void setTongTien(double tongTien) {
		this.tongTien = tongTien;
	}
	public String getPhuongThucThanhToan() {
		return phuongThucThanhToan;
	}
	public void setPhuongThucThanhToan(String phuongThucThanhToan) {
		this.phuongThucThanhToan = phuongThucThanhToan;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public Timestamp getDate() {
		return ngay;
	}
	public void setDate(Timestamp ngay) {
		this.ngay = ngay;
	}
	
	
	
}
