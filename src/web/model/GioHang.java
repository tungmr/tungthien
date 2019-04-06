package web.model;

import java.util.HashMap;
import java.util.Map;

public class GioHang {
	private HashMap<Long, VatPham> cacVatPham;

	public GioHang() {
		cacVatPham = new HashMap<>();
	}

	public GioHang(HashMap<Long, VatPham> cacVatPham) {
		super();
		this.cacVatPham = cacVatPham;
	}

	public HashMap<Long, VatPham> getCacVatPham() {
		return cacVatPham;
	}

	public void setCacVatPham(HashMap<Long, VatPham> cacVatPham) {
		this.cacVatPham = cacVatPham;
	}

	// thêm vật phẩm vào giỏ hàng
	public void ThemVaoGioHang(Long key, VatPham vatPham) {
		boolean b = cacVatPham.containsKey(key);
		if (b) {
			int soLuongCu = vatPham.getSoLuong();
			vatPham.setSoLuong(soLuongCu + 1);
			cacVatPham.put(key, vatPham);
		} else {
			cacVatPham.put(key, vatPham);
		}
	}

	// Trừ số lượng vật phẩm trong giỏ hàng
	public void TruSoLuong(Long key, VatPham vatPham) {
		int soLuongCu = vatPham.getSoLuong();
		if (soLuongCu <= 1) {
			cacVatPham.remove(key);
			}
		else {
			vatPham.setSoLuong(vatPham.getSoLuong() - 1);
			cacVatPham.put(key, vatPham);
		}
	}
	
	// Xóa vật phẩm trong giỏ hàng
	
	public void XoaVatPham(Long key) {
		boolean b = cacVatPham.containsKey(key);
		if (b) {
			cacVatPham.remove(key);
		}
	}
	
	// đếm vật phẩm trong giỏ hàng 
	
	public int DemVatPham()
	{
		return cacVatPham.size();
	}
	
	// tính tổng tiền
	
	public double TinhTienGioHang()
	{
		double sum=0;
		for (Map.Entry<Long,VatPham> list : cacVatPham.entrySet()) {
			sum += list.getValue().getSanPham().getGiaSanPham()*list.getValue().getSoLuong();
		}
		
		return sum;
	}
	
	

}
