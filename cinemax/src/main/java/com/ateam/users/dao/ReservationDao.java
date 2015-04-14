package com.ateam.users.dao;

import java.util.List;

import com.ateam.users.model.Reservation;

public interface ReservationDao {
	Integer addReservation(Reservation reservation);
	void updateReservation(Reservation reservation, Integer id);
	Reservation getReservation(int id);
	void deleteReservation(int id);
	List<Reservation> getReservations();
}
