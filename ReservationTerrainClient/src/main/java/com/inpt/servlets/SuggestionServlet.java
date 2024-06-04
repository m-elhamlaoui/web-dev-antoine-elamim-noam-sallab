package com.inpt.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.inpt.beans.Suggestion;
import com.inpt.dao.DaoException;
import com.inpt.dao.DaoFactory;
import com.inpt.dao.ReservationDao;
import com.inpt.dao.SuggestionDao;

/**
 * Servlet implementation class SuggestionServlet
 */
public class SuggestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private SuggestionDao suggestionDao;

    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.suggestionDao = daoFactory.getSuggestionDao();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("name");
		String email = request.getParameter("email");
		String niveau = request.getParameter("subject");
		String suggestionText = request.getParameter("message");
		
		Suggestion suggestion = new Suggestion();
		suggestion.setNom(nom);
		suggestion.setEmail(email);
		suggestion.setNiveau(niveau);
		suggestion.setSuggestion(suggestionText);
		
		try {
			suggestionDao.ajouterSuggestion(suggestion);
			request.setAttribute("status", "success");
			this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			request.setAttribute("erreur", e.getMessage());
		}
		
	}

}
