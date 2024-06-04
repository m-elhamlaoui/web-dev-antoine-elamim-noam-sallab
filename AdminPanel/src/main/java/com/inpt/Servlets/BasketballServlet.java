package com.inpt.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.inpt.dao.AdminDashboardDao;
import com.inpt.dao.DaoFactory;

/**
 * Servlet implementation class BasketballServlet
 */
public class BasketballServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AdminDashboardDao adminDashboardDao;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.adminDashboardDao = daoFactory.getAdminDashboardDao();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("reservationsBasket", adminDashboardDao.listerLesReservationsSport("Basketball"));
		} catch (Exception e) {
			request.setAttribute("erreur", e.getMessage());
		}
		this.getServletContext().getRequestDispatcher("/basketball.jsp").forward(request, response);
	}
}
