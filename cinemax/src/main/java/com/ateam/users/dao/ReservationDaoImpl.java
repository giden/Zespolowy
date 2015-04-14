package com.ateam.users.dao;


import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ateam.users.model.Reservation;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Integer addReservation(Reservation reservation) {

		reservation.setReservationId(null);
		return (Integer) sessionFactory.getCurrentSession().save(reservation);

	}

	@Override
	public void updateReservation(Reservation reservation, Integer id) {
		Reservation reservationToUpdate = getReservation(id);
        reservationToUpdate.setName(reservation.getName());
        reservationToUpdate.setSurname(reservation.getSurname());

        sessionFactory.getCurrentSession().update(reservationToUpdate);
		
	}

	@Override
	public Reservation getReservation(int id) {
		Reservation reservation = (Reservation) sessionFactory.getCurrentSession().get(Reservation.class, id);
	    return reservation;
	}

	@Override
	public void deleteReservation(int id) {
		Reservation team = getReservation(id);
	        if (team != null)
	        	sessionFactory.getCurrentSession().delete(team);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Reservation> getReservations() {
        return sessionFactory.getCurrentSession().createQuery("from Reservation").list();
	}

}

