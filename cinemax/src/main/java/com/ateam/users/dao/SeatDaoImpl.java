package com.ateam.users.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ateam.users.model.Reservation;
import com.ateam.users.model.Seat;

@Repository
public class SeatDaoImpl implements SeatDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public Seat findBySeatId(Integer id) {

		List<Seat> seats = new ArrayList<Seat>();

		seats = sessionFactory.getCurrentSession().createQuery("from Seat where seatId=?").setParameter(0, id)
				.list();

		if (seats.size() > 0) {
			return seats.get(0);
		} else {
			return null;
		}

	}
	
	@Override
	public Integer addSeat(Seat seat) {

		seat.setSeatId(null);
		return (Integer) sessionFactory.getCurrentSession().save(seat);

	}

	@Override
	public void updateSeat(Seat seat, Integer id) {
		Seat seatToUpdate = getSeat(id);
        sessionFactory.getCurrentSession().update(seatToUpdate);
		
	}

	@Override
	public Seat getSeat(int id) {
		Seat film = (Seat) sessionFactory.getCurrentSession().get(Seat.class, id);
	    return film;
	}

	@Override
	public void deleteSeat(int id) {
		Seat seatToDelete = getSeat(id);
	        if (seatToDelete != null)
	        	sessionFactory.getCurrentSession().delete(seatToDelete);
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Seat> getSeatsByReservation(Reservation reservation) {
        return sessionFactory.getCurrentSession().createQuery("from Seat where reservation=?").setParameter(0, reservation).list();
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Seat> getSeats() {
        return sessionFactory.getCurrentSession().createQuery("from Seat").list();
	}


}