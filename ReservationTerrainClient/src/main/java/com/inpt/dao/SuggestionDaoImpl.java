package com.inpt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.inpt.beans.Suggestion;
import com.inpt.dao.DaoFactory;


public class SuggestionDaoImpl implements SuggestionDao {
	 private DaoFactory daoFactory;

	 SuggestionDaoImpl(DaoFactory daoFactory) {
	        this.daoFactory = daoFactory;
	    }

	@Override
	public void ajouterSuggestion(Suggestion suggestion) throws DaoException {
		Connection connexion = null;
        PreparedStatement preparedStatement = null;
        PreparedStatement pst = null;
        ResultSet resultSet = null;

        try {
            connexion = daoFactory.getConnection();
            
            preparedStatement = connexion.prepareStatement("INSERT INTO suggestions(nom, email, niveau, suggestions) VALUES(?, ?, ?, ?);");
            preparedStatement.setString(1, suggestion.getNom());
            preparedStatement.setString(2, suggestion.getEmail());
            preparedStatement.setString(3, suggestion.getNiveau());
            preparedStatement.setString(4, suggestion.getSuggestion());

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

}
