package web.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dao.UserDAO;
import web.model.User;
import web.tools.MD5;

/**
 * Servlet implementation class HandlerUser
 */
@WebServlet("/HandlerUser")
public class HandlerRegister extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		if (!request.getParameter("name").equals("") && !request.getParameter("username").equals("") && !request.getParameter("email").equals("")
				&& !request.getParameter("password").equals("") 	&& !request.getParameter("repassword").equals("") && !request.getParameter("phoneNumber").equals("")) {
			String password = request.getParameter("password");
			String repassword= request.getParameter("repassword");
			if(!password.equals(repassword)) {
				response.sendRedirect("register.jsp?e=1");
			}else {
				String name = request.getParameter("name");
				String username = request.getParameter("username");
				
				String hashPassword = MD5.md5(password);
				String email = request.getParameter("email");
				String phoneNumber = request.getParameter("phoneNumber");
				User user = new User(0,name, username, hashPassword, email, phoneNumber, 0);
				if (UserDAO.insertUser(user)) {
					response.sendRedirect("register.jsp?e=0");
				} else
					response.sendRedirect("register.jsp?e=1");
			}
		} else {
			response.sendRedirect("register.jsp?e=1");
		}
	}

}
