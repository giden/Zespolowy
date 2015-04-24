package com.ateam.users.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ateam.users.dao.ReservationDao;
import com.ateam.users.dao.SeatDao;
import com.ateam.users.model.Reservation;
import com.ateam.users.model.Seat;

@Service("seatService")
public class SeatServiceImpl implements SeatService {
	
	@Autowired
	private SeatDao seatDao;
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Transactional
	@Override
	public Integer addSeat(Seat seat) {
	
		return seatDao.addSeat(seat);
		
	}
	@Transactional
	@Override
	public void updateSeat(Seat seat, Integer id) {
		
		seatDao.updateSeat(seat, id);
		
	}
	@Transactional
	@Override
	public Seat getSeat(int id) {
		return seatDao.getSeat(id);
	}
	@Transactional
	@Override
	public void deleteSeat(int id) {
		seatDao.deleteSeat(id);
		
	}
	
	@Transactional
	@Override
	public List<Seat> getSeatsReservation(Reservation reservation) {
		
		return seatDao.getSeatsByReservation(reservation);
	}
	
	@Transactional
	@Override
	public List<Seat> getSeats() {
		
		return seatDao.getSeats();
	}
	
	@Transactional
	@Override
	public Reservation getReservationById(Integer id) {
		
		return reservationDao.getReservation(id);
	}
	
	@Transactional
	@Override
	public List<Reservation> getReservationsByShow(Integer id) {
		
		return reservationDao.getReservationsShow(id);
	}
	
	@Transactional
	@Override
	public List<Reservation> getReservations() {
		
		return reservationDao.getReservations();
	}

}
