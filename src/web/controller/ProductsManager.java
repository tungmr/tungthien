package web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import web.dao.SanPhamDAO;
import web.model.SanPham;

/**
 * Servlet implementation class ProductsManager
 */
@WebServlet("/ProductsManager")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024
		* 100)
public class ProductsManager extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private static final String UPLOAD_DIR = "images";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String c = "";
		if (request.getParameter("c") != null)
			c = request.getParameter("c");
		switch (c) {
		case "them":
			try {
				SanPham sanPham = new SanPham();
				sanPham.setDanhMuc(Integer.parseInt(request.getParameter("danhMuc")));
				sanPham.setTheLoai(Integer.parseInt(request.getParameter("theLoai")));
				sanPham.setTenSanPham(request.getParameter("tenSanPham"));
				sanPham.setGiaSanPham(Double.parseDouble(request.getParameter("giaSanPham")));
				sanPham.setMoTaSanPham(request.getParameter("moTa"));
				sanPham.setSoLuong(Integer.parseInt(request.getParameter("soLuong")));
				sanPham.setAnhSanPham(uploadFile(request));

				// Thêm vào db
				if(SanPhamDAO.themSanPham(sanPham))
				response.sendRedirect("/LapTrinhWeb/admin/productsmanager.jsp?adsc=1");
				else {
					response.sendRedirect("/LapTrinhWeb/admin/productsmanager.jsp?adsc=0");

				}

			} catch (Exception ex) {
			}
			break;
		case "capnhap":
			try {
				SanPham sanPham = SanPhamDAO.getSanPhamByIdSanPham(Integer.parseInt(request.getParameter("idSanPham")));
				SanPham sanPhamNew = new SanPham();
				if (request.getParameter("danhMuc") == null)
					sanPhamNew.setDanhMuc(sanPham.getDanhMuc());
				else {
					sanPhamNew.setDanhMuc(Integer.parseInt(request.getParameter("danhMuc")));
				}

				if (request.getParameter("theLoai") == null)
					sanPhamNew.setTheLoai(sanPham.getTheLoai());
				else {
					sanPhamNew.setTheLoai(Integer.parseInt(request.getParameter("theLoai")));

				}
				if (request.getParameter("tenSanPham") == null) {
					sanPhamNew.setTenSanPham(sanPham.getTenSanPham());
				} else {
					sanPhamNew.setTenSanPham(request.getParameter("tenSanPham"));

				}
				if (request.getParameter("giaSanPham") == null)
					sanPhamNew.setGiaSanPham(sanPham.getGiaSanPham());
				else
					sanPhamNew.setGiaSanPham(Double.parseDouble(request.getParameter("giaSanPham")));
				if (request.getParameter("moTa") == null)
					sanPhamNew.setMoTaSanPham(sanPham.getMoTaSanPham());
				else {
					sanPhamNew.setMoTaSanPham(request.getParameter("moTa"));

				}
				if (request.getParameter("soLuong") == null)
					sanPhamNew.setSoLuong(sanPham.getSoLuong());
				else {
					sanPhamNew.setSoLuong(Integer.parseInt(request.getParameter("soLuong")));
				}
				String fileName = "";
				Part filePart = request.getPart("hinhAnh");
				fileName = (String) getFileName(filePart);
				if (fileName.equals("")) {
					sanPhamNew.setAnhSanPham(sanPham.getAnhSanPham());
				} else {
					sanPhamNew.setAnhSanPham(uploadFile(request));
				}

				// Chỉnh sửa ở DB vào db
				if (SanPhamDAO.suaSanPham(sanPhamNew, Integer.parseInt(request.getParameter("idSanPham"))))
					response.sendRedirect("/LapTrinhWeb/admin/productsmanager.jsp?adscedit=1");
				else {
					response.sendRedirect("/LapTrinhWeb/admin/productsmanager.jsp?adscedit=0");
				}

			} catch (Exception ex) {
				
			}
			break;
		case "xoa":
			int idSanPham = 0;
			if (request.getParameter("idSanPham") != null) {
				idSanPham = Integer.parseInt(request.getParameter("idSanPham"));
			}
			if (SanPhamDAO.xoaSanPham(idSanPham)) {
				response.sendRedirect("/LapTrinhWeb/admin/productsmanager.jsp?delpro=1");
			}
			break;
		default:
			break;
		}

	}

	private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
		String fileName = "";
		try {
			Part filePart = request.getPart("hinhAnh");

			// fileName: picture-001.jpg
			fileName = (String) getFileName(filePart);
			// applicationPath:
			String applicationPath = request.getServletContext().getRealPath("");
			System.out.println(applicationPath);
			// File.separator: \
			String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
			System.out.println(basePath);
			InputStream inputStream = null;
			OutputStream outputStream = null;
			OutputStream outputStream2 = null;
			String duongDan = "D:/LapTrinhWeb/WebContent/images/";
			try {
				File outputFilePath = new File(basePath + fileName);
				File outputFilePath2 = new File(duongDan + fileName);
				inputStream = filePart.getInputStream();
				outputStream = new FileOutputStream(outputFilePath);
				outputStream2 = new FileOutputStream(outputFilePath2);
			
				int read = 0;
				final byte[] bytes = new byte[1024];
				while ((read = inputStream.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
					outputStream2.write(bytes, 0, read);
				}
			} catch (Exception e) {
				e.printStackTrace();
				fileName = "";
			} finally {
				if (inputStream != null) {
					inputStream.close();
				}
				if (outputStream != null) {
					outputStream.close();
					outputStream2.close();
				}
			}
		} catch (Exception e) {
			fileName = "";
		}
		return fileName;
	}

	private String getFileName(Part part) {
		final String partHeader = part.getHeader("content-disposition");
		// System.out.println("partHeader :" + partHeader);
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
