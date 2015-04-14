package com.ateam.users.service;

import java.util.List;

import com.ateam.users.model.Reservation;

public interface ReservationService {

	 	public Integer addReservation(Reservation reservation);
	    public void updateReservation(Reservation reservation, Integer id);
	    public Reservation getReservation(int id);
	    public void deleteReservation(int id);
	    public List<Reservation> getReservations();
	
}
