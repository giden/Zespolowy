package com.ateam.users.service;

import java.util.List;

import com.ateam.users.model.Film;
import com.ateam.users.model.Show;

public interface ShowService {

	void updateShow(Show show, Integer id);

	Show getShow(int id);

	void deleteShow(int id);

	List<Show> getShows();

	Integer addShow(Show show);

	Film getFilmById(Integer id);

	List<Film> getFilms();

}
