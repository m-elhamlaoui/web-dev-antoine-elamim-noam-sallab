package com.inpt.dao;

import com.inpt.beans.User;

public interface UserDao {
	
	void ajouterUtilisateur(User user) throws DaoException;
	boolean utilisateurValide(String name, String password) throws DaoException;
	
}
