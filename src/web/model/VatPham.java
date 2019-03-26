package web.model;

public class VatPham {
	private SanPham sanPham;
	private int soLuong;

	
	public VatPham() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VatPham(SanPham sanPham, int soLuong) {
		super();
		this.sanPham = sanPham;
		this.soLuong = soLuong;
	}
	public SanPham getSanPham() {
		return sanPham;
	}
	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	
}
