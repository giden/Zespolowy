package com.ateam.users.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ateam.users.dao.FilmDao;
import com.ateam.users.model.Film;

@Service("filmService")
public class FilmServiceImpl implements FilmService {
	
	@Autowired
	private FilmDao filmDao;
	
	@Transactional
	@Override
	public Integer addFilm(Film film) {
	
		return filmDao.addFilm(film);
		
	}
	@Transactional
	@Override
	public void updateFilm(Film film, Integer id) {
		
		filmDao.updateFilm(film, id);
		
	}
	@Transactional
	@Override
	public Film getFilm(int id) {
		return filmDao.getFilm(id);
	}
	@Transactional
	@Override
	public void deleteFilm(int id) {
		filmDao.deleteFilm(id);
		
	}
	@Transactional
	@Override
	public List<Film> getFilms() {
		
		return filmDao.getFilms();
	}
	

}
