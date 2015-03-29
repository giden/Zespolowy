package com.ateam.users.dao;

import java.util.List;

import com.ateam.users.model.Film;


public interface FilmDao {

	Integer addFilm(Film film);
	void updateFilm(Film film, Integer id);
	Film getFilm(int id);
	void deleteFilm(int id);
	List<Film> getFilms();

}
