package com.ateam.users.service;

import java.util.List;

import com.ateam.users.model.Reservation;
import com.ateam.users.model.Show;

public interface ReservationService {

	 	public Integer addReservation(Reservation reservation);
	    public void updateReservation(Reservation reservation, Integer id);
	    public Reservation getReservation(int id);
	    public void deleteReservation(int id);
	    public List<Reservation> getReservations();
		public Show getShowById(Integer id);
		public List<Reservation> getReservationsClient(String surname);
		public List<Reservation> getReservationsUser(String username);
	
}
