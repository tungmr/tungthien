package web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dao.TheLoaiDAO;

/**
 * Servlet implementation class DeleteKindManager
 */
@WebServlet("/KindManager")
public class KindManager extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String c = "";
		String idTheLoai = "";
		if (request.getParameter("idTheLoai") != null && request.getParameter("c") != null) {
			idTheLoai = request.getParameter("idTheLoai");
			c = request.getParameter("c");
			switch (c) {
			case "xoa":
				if (TheLoaiDAO.xoaTheLoai(Integer.parseInt(idTheLoai))) {
					response.sendRedirect("admin/kindmanager.jsp?delsc=1");
				}
				break;
			case "sua":
				if (request.getParameter("idDanhMuc") != null && request.getParameter("tenTheLoai") != null) {
					String idDanhMuc = request.getParameter("idDanhMuc");
					String tenTheLoai = request.getParameter("tenTheLoai");
					if (TheLoaiDAO.suaTheLoai(Integer.parseInt(idTheLoai), Integer.parseInt(idDanhMuc), tenTheLoai)) {
						response.sendRedirect("admin/kindmanager.jsp?edsc=1");
					}
				}
				break;
			case "them":
				if (request.getParameter("idDanhMuc") != null && request.getParameter("tenTheLoai") != null) {
					String idDanhMuc = request.getParameter("idDanhMuc");
					String tenTheLoai = request.getParameter("tenTheLoai");
					if (TheLoaiDAO.themTheLoai(Integer.parseInt(idDanhMuc), tenTheLoai)) {
						response.sendRedirect("admin/kindmanager.jsp?adsc=1");
					}
				}
				break;
			default:
				break;
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
