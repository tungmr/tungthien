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
			SanPham sanPham = SanPhamDAO.getSanPhamByIdSanPham(idSP);
			//System.out.println(gioHang.getCacVatPham().containsKey(Long.parseLong(idSanPham)));
			switch (c) {
			case "them":
				if (gioHang.getCacVatPham().containsKey(Long.parseLong(idSanPham))) {
					gioHang.ThemVaoGioHang(Long.parseLong(idSanPham), new VatPham(sanPham, gioHang.getCacVatPham().get(Long.parseLong(idSanPham)).getSoLuong()));
				}else {
					//System.out.println("Vào đây");
					gioHang.ThemVaoGioHang(Long.parseLong(idSanPham), new VatPham(sanPham, 1));
				}
				httpSession.removeAttribute("cart");
				httpSession.setAttribute("cart", gioHang);
				response.sendRedirect("index.jsp");

				break;
				
			case "themincart":
				gioHang.ThemVaoGioHang(Long.parseLong(idSanPham), new VatPham(sanPham, gioHang.getCacVatPham().get(Long.parseLong(idSanPham)).getSoLuong()));
				httpSession.removeAttribute("cart");

				httpSession.setAttribute("cart", gioHang);
				response.sendRedirect("cart.jsp");

				break;
				
			case "xoa":
				gioHang.XoaVatPham(Long.parseLong(idSanPham));
				httpSession.setAttribute("cart", gioHang);
				response.sendRedirect("index.jsp");

				break;

			default:
				break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			//response.sendRedirect("index.jsp");

		}
		
		
				
	}

}
