package com.inpt.dao;

import java.util.List;

import com.inpt.beans.AdminDashboard;
import com.inpt.beans.*;

public interface AdminDashboardDao {
	
	List<AdminDashboard> listerToutesLesReservations() throws DaoException;
	Statistic getStatistic() throws DaoException;
	
	List<AdminDashboard> listerLesReservationsSport(String sport) throws DaoException;
	
}
