package com.ateam.users.dao;



import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ateam.users.model.Film;

@Repository
public class FilmDaoImpl implements FilmDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Integer addFilm(Film film) {

		film.setFilmId(null);
		return (Integer) sessionFactory.getCurrentSession().save(film);

	}

	@Override
	public void updateFilm(Film film, Integer id) {
		Film filmToUpdate = getFilm(id);
        filmToUpdate.setName(film.getName());
        sessionFactory.getCurrentSession().update(filmToUpdate);
		
	}

	@Override
	public Film getFilm(int id) {
		Film film = (Film) sessionFactory.getCurrentSession().get(Film.class, id);
	    return film;
	}

	@Override
	public void deleteFilm(int id) {
		Film team = getFilm(id);
	        if (team != null)
	        	sessionFactory.getCurrentSession().delete(team);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Film> getFilms() {
        return sessionFactory.getCurrentSession().createQuery("from Film").list();
	}

}
