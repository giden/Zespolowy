package com.ateam.users.service;

import java.util.List;

import com.ateam.users.model.Film;

public interface FilmService {

	 public Integer addFilm(Film film);
	    public void updateFilm(Film film, Integer id);
	    public Film getFilm(int id);
	    public void deleteFilm(int id);
	    public List<Film> getFilms();
	
}
