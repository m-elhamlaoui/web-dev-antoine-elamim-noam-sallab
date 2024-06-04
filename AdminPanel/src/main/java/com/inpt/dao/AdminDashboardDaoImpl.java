package com.inpt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.inpt.beans.AdminDashboard;
import com.inpt.beans.BeanException;
import com.inpt.beans.Statistic;
import com.inpt.dao.DaoException;

public class AdminDashboardDaoImpl implements AdminDashboardDao{
	private DaoFactory daoFactory;
	
	AdminDashboardDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

	@Override
	public List<AdminDashboard> listerToutesLesReservations() throws DaoException {
		List<AdminDashboard> reservations = new ArrayList<AdminDashboard>();
		Connection connexion = null;
		Statement statement = null;
        ResultSet resultat = null;
        String query = "SELECT users.name, users.email, users.mobile, reservations.sport, reservations.date, reservations.time_slot "
        		+ 		"FROM users "
        		+ 		"INNER JOIN reservations ON users.id=reservations.user_id;";
        
        try {
        	connexion = daoFactory.getConnection();
        	statement = connexion.createStatement();
        	resultat = statement.executeQuery(query);
        	
        	while (resultat.next()) {
        		String nom = resultat.getString("name");
        		String email = resultat.getString("email");
        		String mobile = resultat.getString("mobile");
        		String sport = resultat.getString("sport");
        		String date = resultat.getString("date");
        		String time_slot = resultat.getString("time_slot");
        		
        		AdminDashboard reservation = new AdminDashboard();
        		reservation.setNom(nom);
        		reservation.setEmail(email);
        		reservation.setMobile(mobile);
        		reservation.setSport(sport);
        		reservation.setDate(date);
        		reservation.setTime_slot(time_slot);

        		reservations.add(reservation);
        	}
        } catch (SQLException e) {
            throw new DaoException("Impossible de communiquer avec la base de données DAO");
        } finally {
            try {
                if (connexion != null) {
                    connexion.close();  
                }
            } catch (SQLException e) {
                throw new DaoException("Impossible de communiquer avec la base de données");
            }
        }
        
        
		return reservations;
	}
	
	@Override
	public Statistic getStatistic() throws DaoException{
		Statistic stat = new Statistic();
		Connection connexion = null;
		Statement statement = null;
        ResultSet resultat = null;
        String query = 	"SELECT "
        		+ 		"(SELECT COUNT(users.id) FROM users) AS nbUser, "
        		+ 		"(SELECT COUNT(reservations.sport) FROM reservations WHERE sport='Football') AS nbFoot, "
        		+ 		"(SELECT COUNT(reservations.sport) FROM reservations WHERE sport='Volleyball') AS nbVolley, "
        		+ 		"(SELECT COUNT(reservations.sport) FROM reservations WHERE sport='Basketball') AS nbBasket;";
        
        try {
        	connexion = daoFactory.getConnection();
        	statement = connexion.createStatement();
        	resultat = statement.executeQuery(query);
        	
        	while (resultat.next()) {
        		int nbUser = resultat.getInt("nbUser");
        		int nbFoot = resultat.getInt("nbFoot");
        		int nbBasket = resultat.getInt("nbBasket");
        		int nbVolley = resultat.getInt("nbVolley");
        		
        		stat.setNbUser(nbUser);
        		stat.setNbFoot(nbFoot);
        		stat.setNbBasket(nbBasket);
        		stat.setNbVolley(nbVolley);
        	}
        } catch (SQLException e) {
            throw new DaoException("Impossible de communiquer avec la base de données DAO");
        } finally {
            try {
                if (connexion != null) {
                    connexion.close();  
                }
            } catch (SQLException e) {
                throw new DaoException("Impossible de communiquer avec la base de données");
            }
        }
        
		return stat;
	}
	
	@Override
	public List<AdminDashboard> listerLesReservationsSport(String sportEntre) throws DaoException {
		List<AdminDashboard> reservations = new ArrayList<AdminDashboard>();
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
        ResultSet resultat = null;
        String query = "SELECT users.name, users.email, users.mobile, reservations.sport, reservations.date, reservations.time_slot "
        		+ 		"FROM users "
        		+ 		"INNER JOIN reservations ON users.id=reservations.user_id "
        		+ 		"WHERE sport=?;";
        
        try {
        	connexion = daoFactory.getConnection();
        	preparedStatement = connexion.prepareStatement(query);
        	preparedStatement.setString(1, sportEntre);
        	resultat = preparedStatement.executeQuery();
        	while (resultat.next()) {
        		String nom = resultat.getString("name");
        		String email = resultat.getString("email");
        		String mobile = resultat.getString("mobile");
        		String sport = resultat.getString("sport");
        		String date = resultat.getString("date");
        		String time_slot = resultat.getString("time_slot");
        		
        		AdminDashboard reservation = new AdminDashboard();
        		reservation.setNom(nom);
        		reservation.setEmail(email);
        		reservation.setMobile(mobile);
        		reservation.setSport(sport);
        		reservation.setDate(date);
        		reservation.setTime_slot(time_slot);
        		
        		reservations.add(reservation);
        	}
        } catch (SQLException e) {
            throw new DaoException("Impossible de communiquer avec la base de données DAO");
        } finally {
            try {
                if (connexion != null) {
                    connexion.close();  
                }
            } catch (SQLException e) {
                throw new DaoException("Impossible de communiquer avec la base de données");
            }
	}
        return reservations;
	}
}
