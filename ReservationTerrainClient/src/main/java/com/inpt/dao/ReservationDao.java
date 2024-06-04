package com.inpt.dao;


import com.inpt.dao.DaoException;

import java.util.List;

import com.inpt.beans.Reservation;

public interface ReservationDao {
	// Créer un nouveau rendez-vous
    void ajouterReservation( Reservation reservation, String userName, String sport ) throws DaoException;
        
    // Liste les heures résérvées à partir d'une date
    List<Reservation> obtenirLesHeursRésérvées(String date, String sport) throws DaoException;
    
    //Liste les Résérvation d'un utilisateur
    List<Reservation> obtenirReservation(String nom) throws DaoException;
    
    //Annuller une Résérvation
    void annulerReservation(String name, String date, String time, String sport) throws DaoException;
    
    
}
