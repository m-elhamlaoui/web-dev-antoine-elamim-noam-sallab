package com.inpt.dao;

import com.inpt.beans.Suggestion;

public interface SuggestionDao {
	void ajouterSuggestion(Suggestion suggestion) throws DaoException;
}
