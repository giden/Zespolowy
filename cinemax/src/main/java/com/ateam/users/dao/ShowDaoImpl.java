package com.ateam.users.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ateam.users.model.Show;

@Repository
public class ShowDaoImpl implements ShowDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public Show findByShowId(Integer id) {

		List<Show> shows = new ArrayList<Show>();

		shows = sessionFactory.getCurrentSession().createQuery("from Show where showId=?").setParameter(0, id)
				.list();

		if (shows.size() > 0) {
			return shows.get(0);
		} else {
			return null;
		}

	}
	
	@Override
	public Integer addShow(Show show) {

			show.setDateDayFunction(show.getDate());
		show.setShowId(null);
		return (Integer) sessionFactory.getCurrentSession().save(show);

	}

	@Override
	public void updateShow(Show show, Integer id) {
		Show showToUpdate = getShow(id);
		showToUpdate.setDate(show.getDate());

			showToUpdate.setDateDayFunction(show.getDate());

        sessionFactory.getCurrentSession().update(showToUpdate);
		
	}

	@Override
	public Show getShow(int id) {
		Show film = (Show) sessionFactory.getCurrentSession().get(Show.class, id);
	    return film;
	}

	@Override
	public void deleteShow(int id) {
		Show showToDelete = getShow(id);
	        if (showToDelete != null)
	        	sessionFactory.getCurrentSession().delete(showToDelete);
	        
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Show> getShows() {
        return sessionFactory.getCurrentSession().createQuery("from Show").list();
	}


}