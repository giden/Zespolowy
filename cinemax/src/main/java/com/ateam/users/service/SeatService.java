package com.ateam.users.service;

import java.util.List;

import com.ateam.users.model.Reservation;
import com.ateam.users.model.Seat;

public interface SeatService {

	void updateSeat(Seat seat, Integer id);

	Seat getSeat(int id);

	void deleteSeat(int id);

	List<Seat> getSeats();
	
	List<Seat> getSeatsReservation(Reservation reservation);

	Integer addSeat(Seat seat);

	Reservation getReservationById(Integer id);
	
	List<Reservation> getReservationsByShow(Integer id);

	List<Reservation> getReservations();

}