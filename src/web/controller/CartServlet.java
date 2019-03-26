package web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import web.dao.SanPhamDAO;
import web.model.GioHang;
import web.model.SanPham;
import web.model.VatPham;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private final SanPhamDAO sanPhamDAO = new SanPhamDAO();

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
		
		HttpSession httpSession = request.getSession();
		String c= request.getParameter("c");
		String idSanPham = request.getParameter("idSanPham");
		GioHang gioHang = (GioHang) httpSession.getAttribute("cart");
		
		
		try {
			int idSP = Integer.parseInt(idSanPham);
			SanPham sanPham = sanPhamDAO.getSanPhamByIdSanPham(idSP);
			switch (c) {
			case "them":
				if (gioHang.getCacVatPham().containsKey(idSP)) {
					gioHang.ThemVaoGioHang(Long.parseLong(idSanPham), new VatPham(sanPham, gioHang.getCacVatPham().get(idSP).getSoLuong()));
				}else {
					gioHang.ThemVaoGioHang(Long.parseLong(idSanPham), new VatPham(sanPham, 1));
				}
				
				break;
				
			case "xoa":
				gioHang.XoaVatPham(Long.parseLong(idSanPham));
				break;

			default:
				break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			//response.sendRedirect("index.jsp");

		}
		
		httpSession.setAttribute("cart", gioHang);
		response.sendRedirect("index.jsp");
				
	}

}
