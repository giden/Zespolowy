package com.ateam.users.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ateam.users.dao.ReservationDao;
import com.ateam.users.model.Reservation;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Transactional
	public Integer addReservation(Reservation reservation) {
	
		return reservationDao.addReservation(reservation);
		
	}
	
	@Transactional
	@Override
	public void updateReservation(Reservation reservation, Integer id) {
		
		reservationDao.updateReservation(reservation, id);
		
	}
	@Transactional
	@Override
	public Reservation getReservation(int id) {
		return reservationDao.getReservation(id);
	}
	@Transactional
	@Override
	public void deleteReservation(int id) {
		reservationDao.deleteReservation(id);
		
	}
	@Transactional
	@Override
	public List<Reservation> getReservations() {
		
		return reservationDao.getReservations();
	}
	

}
