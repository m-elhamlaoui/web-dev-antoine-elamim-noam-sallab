package com.inpt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.inpt.beans.AdminDashboard;

public class DaoFactory {
	private String url;
    private String username;
    private String password;

    DaoFactory(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public static DaoFactory getInstance() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {

        }

        DaoFactory instance = new DaoFactory(
                "jdbc:mysql://localhost:3306/reservationterrain", "root", "root1234");
        return instance;
    }

    public Connection getConnection() throws SQLException {
    	Connection connexion = DriverManager.getConnection(url, username, password);
        connexion.setAutoCommit(false);
        return connexion; 
    }

    // Récupération du Dao
    public AdminDashboardDao getAdminDashboardDao() {
        return new AdminDashboardDaoImpl(this);
    }
}
