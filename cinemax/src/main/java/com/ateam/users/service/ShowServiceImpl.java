package com.ateam.users.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ateam.users.dao.FilmDao;
import com.ateam.users.dao.ShowDao;
import com.ateam.users.model.Film;
import com.ateam.users.model.Show;

@Service("showService")
public class ShowServiceImpl implements ShowService {
	
	@Autowired
	private ShowDao showDao;
	
	@Autowired
	private FilmDao filmDao;
	
	@Transactional
	@Override
	public Integer addShow(Show show) {
	
		return showDao.addShow(show);
		
	}
	@Transactional
	@Override
	public void updateShow(Show show, Integer id) {
		
		showDao.updateShow(show, id);
		
	}
	@Transactional
	@Override
	public Show getShow(int id) {
		return showDao.getShow(id);
	}
	@Transactional
	@Override
	public void deleteShow(int id) {
		showDao.deleteShow(id);
		
	}
	@Transactional
	@Override
	public List<Show> getShows() {
		
		return showDao.getShows();
	}
	
	@Transactional
	@Override
	public Film getFilmById(Integer id) {
		
		return filmDao.findByFilmId(id);
	}
	

	@Transactional
	@Override
	public List<Film> getFilms() {
		
		return filmDao.getFilms();
	}

}
