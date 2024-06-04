package com.inpt.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.inpt.dao.UserDao;
import com.inpt.beans.User;
import com.inpt.dao.DaoFactory;

/**
 * Servlet implementation class RegistrationServlet
 */
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
       
	public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.userDao = daoFactory.getUserDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = null;
		dispatcher = request.getRequestDispatcher("registration.jsp");
		dispatcher.forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String rePass = request.getParameter("re_pass");
		String mobile = request.getParameter("contact");
			
		
		// Ajouter l'utilisateur à la base de donnée
		try {
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPass(pass);
			user.setRepass(rePass);
			user.setMobile(mobile);
			
			userDao.ajouterUtilisateur(user);
			request.setAttribute("status", "success");
			this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("status", e.getMessage());
			this.getServletContext().getRequestDispatcher("/registration.jsp").forward(request, response);
		}
		
	}

}
