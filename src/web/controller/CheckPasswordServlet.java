package web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckPasswordServlet
 */
@WebServlet("/CheckPasswordServlet")
public class CheckPasswordServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		if (password.equals(repassword)) {
	          response.getWriter().write("<img src=\"img/available.png\" />");
	     } else {
	          response.getWriter().write("Mật khẩu không khớp");
	     }
	}

}
