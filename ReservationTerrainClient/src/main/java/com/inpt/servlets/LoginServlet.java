package com.inpt.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.inpt.dao.DaoFactory;
import com.inpt.dao.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
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
		dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		if (userName == null || userName.equals("")) {
			request.setAttribute("status", "InvalidUname");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
		if (password == null || password.equals("")) {
			request.setAttribute("status", "InvalidUpwd");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}

		
		try {
			boolean estValide = userDao.utilisateurValide(userName, password);
			request.setAttribute("test", estValide);
			if (estValide) {
				session.setAttribute("uname", userName);
				dispatcher = request.getRequestDispatcher("index1.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("status", e.getMessage());
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
	}

}
