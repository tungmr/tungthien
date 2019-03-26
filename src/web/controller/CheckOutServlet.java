package web.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dao.ChiTietHoaDonDAO;
import web.dao.HoaDonDAO;
import web.model.ChiTietHoaDon;
import web.model.GioHang;
import web.model.HoaDon;
import web.model.User;
import web.model.VatPham;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String phuongThuc ="";
		String diaChi = "";

		
		if (!request.getParameter("diachi").equals("") && request.getParameter("phuongthuc")!=null) {
			phuongThuc =  request.getParameter("phuongthuc");
			diaChi = request.getParameter("diachi");
			HttpSession httpSession = request.getSession();
			User user = (User) httpSession.getAttribute("user");
			GioHang gioHang = (GioHang) httpSession.getAttribute("cart");
			try {
				int ID = (int) new Date().getTime();
				HoaDon hoaDon = new HoaDon();
				hoaDon.setId_hoaDon(ID);
				hoaDon.setId_user(user.getIdUser());
				hoaDon.setPhuongThucThanhToan(phuongThuc);
				hoaDon.setDiaChi(diaChi);
				hoaDon.setTongTien(gioHang.TinhTienGioHang());
				hoaDon.setDate(new Timestamp(new Date().getTime()));
				HoaDonDAO.themHoaDon(hoaDon);
				for (Map.Entry<Long, VatPham> item : gioHang.getCacVatPham().entrySet()) {
					ChiTietHoaDonDAO.themChiTietHoaDon(new ChiTietHoaDon(0,ID,item.getValue().getSanPham().getIdSanPham(),
							item.getValue().getSanPham().getGiaSanPham(), item.getValue().getSoLuong()));
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			response.sendRedirect("checkout.jsp?e=0");
			
		}
		else {
			response.sendRedirect("checkout.jsp?e=1");
		}
	}

}
