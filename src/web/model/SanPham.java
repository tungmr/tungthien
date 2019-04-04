package web.model;

public class SanPham {

	private int theLoai;
	private int danhMuc;
	private int idSanPham;
	private String tenSanPham;
	private String anhSanPham;
	private double giaSanPham;
	private String moTaSanPham;
	private int soLuong;


	

	public SanPham() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public SanPham( int idSanPham, int theLoai, int danhMuc, String tenSanPham, String anhSanPham, double giaSanPham,
			String moTaSanPham, int soLuong) {
		super();
		this.theLoai = theLoai;
		this.danhMuc = danhMuc;
		this.idSanPham = idSanPham;
		this.tenSanPham = tenSanPham;
		this.anhSanPham = anhSanPham;
		this.giaSanPham = giaSanPham;
		this.moTaSanPham = moTaSanPham;
		this.soLuong = soLuong;
	}



	public int getDanhMuc() {
		return danhMuc;
	}

	public void setDanhMuc(int danhMuc) {
		this.danhMuc = danhMuc;
	}

	public int getIdSanPham() {
		return idSanPham;
	}

	public void setIdSanPham(int idSanPham) {
		this.idSanPham = idSanPham;
	}

	public String getAnhSanPham() {
		return anhSanPham;
	}

	public void setAnhSanPham(String anhSanPham) {
		this.anhSanPham = anhSanPham;
	}

	public int getTheLoai() {
		return theLoai;
	}

	public void setTheLoai(int theLoai) {
		this.theLoai = theLoai;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public double getGiaSanPham() {
		return giaSanPham;
	}

	public void setGiaSanPham(double giaSanPham) {
		this.giaSanPham = giaSanPham;
	}

	public String getMoTaSanPham() {
		return moTaSanPham;
	}

	public void setMoTaSanPham(String moTaSanPham) {
		this.moTaSanPham = moTaSanPham;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	

}
