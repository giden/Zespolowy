package com.ateam.users.dao;

import java.util.List;

import com.ateam.users.model.Reservation;
import com.ateam.users.model.Seat;

public interface SeatDao {
	public Seat findBySeatId(Integer id);

	Integer addSeat(Seat seat);

	void updateSeat(Seat seat, Integer id);

	Seat getSeat(int id);
	
	List<Seat> getSeatsByReservation(Reservation reservation);

	void deleteSeat(int id);

	List<Seat> getSeats();
}