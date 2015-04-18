package com.ateam.users.dao;

import java.util.List;

import com.ateam.users.model.Show;

public interface ShowDao {
	public Show findByShowId(Integer id);

	Integer addShow(Show show);

	void updateShow(Show show, Integer id);

	Show getShow(int id);

	void deleteShow(int id);

	List<Show> getShows();
}
