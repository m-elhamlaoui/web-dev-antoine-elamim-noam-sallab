package com.inpt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.inpt.beans.User;
import com.inpt.dao.DaoFactory;
import com.inpt.dao.DaoException;

public class UserDaoImpl implements UserDao{
	private DaoFactory daoFactory;

    UserDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
	
    @Override
	public void ajouterUtilisateur(User user) throws DaoException {
    	Connection connexion = null;
    	PreparedStatement preparedStatement = null;
    	try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO users(name, email, password, mobile) VALUES(?, ?, ?, ?);");            
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPass());
            preparedStatement.setString(4, user.getMobile());
            
            preparedStatement.executeUpdate();
            connexion.commit();
            
        } catch (SQLException e) {
            try {
                if (connexion != null) {
                    connexion.rollback();
                }
            } catch (SQLException e2) {
            }
            if (e.getErrorCode() == 1062) { 
                throw new DaoException("email_duplicate");
            } else {
                throw new DaoException("failed");
            }
        } finally {
            try {
                if (connexion != null) {
                    connexion.close();  
                }
            } catch (SQLException e) {
                throw new DaoException("Impossible de communiquer avec la base de données");
            }
        }
	}
    
    @Override
    public boolean utilisateurValide(String name, String password) throws DaoException {
    	Connection connexion = null;
    	PreparedStatement preparedStatement = null;
    	try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM users WHERE name=? AND password=?;");            
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);
            
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
            
        } catch (SQLException e) {
            throw new DaoException("Impossible de communiquer avec la base de données");
        } finally {
            try {
                if (connexion != null) {
                    connexion.close();  
                }
            } catch (SQLException e) {
                throw new DaoException("Impossible de communiquer avec la base de données");
            }
        }
    	
    	
    }
}
