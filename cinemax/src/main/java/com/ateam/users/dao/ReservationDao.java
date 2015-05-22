package com.ateam.users.dao;

import java.util.List;

import com.ateam.users.model.Reservation;

public interface ReservationDao {
	Integer addReservation(Reservation reservation);
	void updateReservation(Reservation reservation, Integer id);
	Reservation getReservation(int id);
	List<Reservation> getReservationsShow(Integer id);
	void deleteReservation(int id);
	List<Reservation> getReservations();
	List<Reservation> getReservationsClient(String surname);
	List<Reservation> getReservationsUser(String username);
}
