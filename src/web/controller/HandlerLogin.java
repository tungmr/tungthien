package web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dao.UserDAO;
import web.model.User;

/**
 * Servlet implementation class HandlerLogin
 */
@WebServlet("/HandlerLogin")
public class HandlerLogin extends HttpServlet {

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
		if (request.getParameter("username") != null && request.getParameter("password") != null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String hashPassword = MD5.md5(password);

			if (UserDAO.checkUserLogin(username, hashPassword)) {
				User user = UserDAO.getUser(username);
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("user", user);
				int role = user.getRoleUser();
				if (role ==0) {
					response.sendRedirect("index.jsp");
				}else if (role ==1) {
					response.sendRedirect("/LapTrinhWeb/admin/manager.jsp");
				}
			} else {

				response.sendRedirect("login.jsp?e=1");
			}

		} else {
			response.sendRedirect("/login.jsp?e=1");
		}
	}

}
