package com.inpt.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.inpt.dao.DaoException;
import com.inpt.dao.DaoFactory;
import com.inpt.dao.ReservationDao;

/**
 * Servlet implementation class MesReservationsServlet
 */
public class MesReservationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReservationDao reservationDao;

    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.reservationDao = daoFactory.getReservationDao();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		String name = (String) session.getAttribute("uname");
		try {
			request.setAttribute("reservations", reservationDao.obtenirReservation(name));
			dispatcher = request.getRequestDispatcher("mesreservations.jsp");
			dispatcher.forward(request, response);
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			request.setAttribute("erreur", e.getMessage());
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = (String) request.getParameter("name");
		String date = (String) request.getParameter("date");
		String houre = (String) request.getParameter("houre");
		String sport = (String) request.getParameter("sport");
		
		HttpSession session = request.getSession();
		
		RequestDispatcher dispatcher = null;
		try {
			reservationDao.annulerReservation(name, date, houre, sport);
			request.setAttribute("reservations", reservationDao.obtenirReservation(name));
			request.setAttribute("status", "success");
			
			dispatcher = request.getRequestDispatcher("mesreservations.jsp");
			dispatcher.forward(request, response);
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			request.setAttribute("status", e.getMessage());
		}
	}

	

}
