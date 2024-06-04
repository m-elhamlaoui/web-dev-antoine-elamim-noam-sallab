package com.inpt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.inpt.beans.Reservation;
import com.inpt.beans.BeanException;
import com.inpt.dao.DaoException;
import com.inpt.dao.DaoFactory;
import com.inpt.dao.ReservationDao;

public class ReservationDaoImpl implements ReservationDao {
    private DaoFactory daoFactory;

    ReservationDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    @Override
    public void ajouterReservation( Reservation reservation, String userName, String sport ) throws DaoException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        PreparedStatement pst = null;
        ResultSet resultSet = null;

        try {
            connexion = daoFactory.getConnection();
            connexion.setAutoCommit(false);
            
            // Récupération de l'ID de l'utilisateur
            String queryId = "SELECT id FROM users WHERE name=?;";
            pst = connexion.prepareStatement(queryId);
            pst.setString(1, userName);
            resultSet = pst.executeQuery();
            
            int userId = -1;
            if (resultSet.next()) {
                userId = resultSet.getInt("id");
            } else {
                throw new DaoException("Utilisateur non trouvé.");
            }
 
            //Insertion de la résérvation
            preparedStatement = connexion.prepareStatement("INSERT INTO reservations(user_id,sport, date, time_slot) VALUES(?, ?, ?, ?);");
            preparedStatement.setInt(1, userId);
            preparedStatement.setString(2, sport);
            preparedStatement.setString(3, reservation.getDate());
            preparedStatement.setString(4, reservation.getHoure());

            preparedStatement.executeUpdate();
            connexion.commit();
        } catch (SQLException e) {
            try {
                if (connexion != null) {
                    connexion.rollback();
                }
            } catch (SQLException e2) {
            }
            throw new DaoException("Impossible de communiquer avec la base de données 1");
        }
        finally {
            try {
                if (connexion != null) {
                    connexion.close();  
                }
            } catch (SQLException e) {
                throw new DaoException("Impossible de communiquer avec la base de données 2");
            }
        }

    }
    
    
    @Override
    public List<Reservation> obtenirLesHeursRésérvées(String dateJour, String sport) throws DaoException {
        List<Reservation> tousReservations = new ArrayList<Reservation>();
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;

        try {
        	connexion = daoFactory.getConnection();
        	preparedStatement = connexion.prepareStatement("SELECT * FROM reservations WHERE date=? AND sport=?;");
        	preparedStatement.setString(1, dateJour);
        	preparedStatement.setString(2, sport);
        	resultat = preparedStatement.executeQuery();

            while (resultat.next()) {
                String date = resultat.getString("date");
                String houre = resultat.getString("time_slot");

                Reservation reservation = new Reservation();
                reservation.setDate(date);
                reservation.setHoure(houre);
                tousReservations.add(reservation);
            }
        } catch (SQLException e) {
            throw new DaoException("Impossible de communiquer avec la base de données 3");
        }
        finally {
            try {
                if (connexion != null) {
                    connexion.close();  
                }
            } catch (SQLException e) {
                throw new DaoException("Impossible de communiquer avec la base de données 4");
            }
        }
        return tousReservations;
    }

	@Override
	public List<Reservation> obtenirReservation(String nom) throws DaoException {
        List<Reservation> tousReservations = new ArrayList<Reservation>();
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;

        try {
        	connexion = daoFactory.getConnection();
        	preparedStatement = connexion.prepareStatement("SELECT sport, date, time_slot FROM reservations WHERE user_id=(SELECT id FROM users WHERE name=?);");
        	preparedStatement.setString(1, nom);
        	resultat = preparedStatement.executeQuery();

            while (resultat.next()) {
                String sport = resultat.getString("sport");
                String date = resultat.getString("date");
                String houre = resultat.getString("time_slot");

                Reservation reservation = new Reservation();
                reservation.setSport(sport);
                reservation.setDate(date);
                reservation.setHoure(houre);
                tousReservations.add(reservation);
            }
        } catch (SQLException e) {
            throw new DaoException("Impossible de communiquer avec la base de données 3");
        }
        finally {
            try {
                if (connexion != null) {
                    connexion.close();  
                }
            } catch (SQLException e) {
                throw new DaoException("Impossible de communiquer avec la base de données 4");
            }
        }
        return tousReservations;
	}

	@Override
	public void annulerReservation(String name, String date, String time, String sport) throws DaoException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;
        try {
        	connexion = daoFactory.getConnection();
        	preparedStatement = connexion.prepareStatement("DELETE FROM reservations WHERE user_id=(SELECT id FROM users WHERE name=?) AND date=? AND time_slot=? AND sport=?");
        	preparedStatement.setString(1, name);
        	preparedStatement.setString(2, date);
        	preparedStatement.setString(3, time);
        	preparedStatement.setString(4, sport);
        	preparedStatement.executeUpdate();
             connexion.commit();
        } catch (SQLException e) {
            throw new DaoException("failed");
        }
        finally {
            try {
                if (connexion != null) {
                    connexion.close();  
                }
            } catch (SQLException e) {
                throw new DaoException("Impossible de communiquer avec la base de données 4");
            }
        }
		
	}
    

}
