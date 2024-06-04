package com.inpt.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.inpt.beans.Reservation;
import com.inpt.dao.DaoException;
import com.inpt.dao.DaoFactory;
import com.inpt.dao.ReservationDao;

/**
 * Servlet implementation class FootballReservation
 */
public class FootballReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReservationDao reservationDao;

    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.reservationDao = daoFactory.getReservationDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedDate = request.getParameter("selectedDate");
        if (selectedDate == null || selectedDate.isEmpty()) {
            selectedDate = LocalDate.now().format(DateTimeFormatter.ISO_DATE);
        }
        try {
            request.setAttribute("selectedDate", selectedDate);
            request.setAttribute("tousReservationJour", reservationDao.obtenirLesHeursRésérvées(selectedDate, "Football"));
        } catch (DaoException e) {
            request.setAttribute("erreur", e.getMessage());
        }
        this.getServletContext().getRequestDispatcher("/football.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	String userName = request.getParameter("userName");
        String date = request.getParameter("date");
        String houre = request.getParameter("houre");
        
        request.setAttribute("status", "failed");
        try {
            Reservation reservation = new Reservation();
            reservation.setDate(date);
            reservation.setHoure(houre);

            reservationDao.ajouterReservation(reservation, userName, "football");
            request.setAttribute("selectedDate", date);
            request.setAttribute("tousReservationJour", reservationDao.obtenirLesHeursRésérvées(date, "Football"));
            request.setAttribute("status", "success");
        } catch (Exception e) {
            request.setAttribute("erreur", e.getMessage());
        }

        this.getServletContext().getRequestDispatcher("/football.jsp").forward(request, response);
    }

}
