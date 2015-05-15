package com.ateam.users.model;

//import java.sql.Date;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "reservations", catalog = "test")
public class Reservation {
	
	private Integer reservationId;
	
	private String name, surname, email, phone;
	private Date date = new Date();
	private List<Seat> seats = new ArrayList<Seat>(0);
	
	private Show show;
	//private List<Seat> seat = new ArrayList<Seat>(0);
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "reservation_id", unique = true, nullable = false)
	public Integer getReservationId() {
		return reservationId;
	}
	public void setReservationId(Integer reservationId) {
		this.reservationId = reservationId;
	}
	
	@Column(name = "reservationname", unique = false, nullable = false, length = 45)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "reservationsurname", unique = false, nullable = false, length = 45)
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	
	@Column(name = "reservationemail", unique = true, nullable = false, length = 45)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name = "reservationphone", unique = false, nullable = true, length = 45)
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	

	
	@Column(name = "reservationdate", unique = false, nullable = true)
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "show_id", nullable = false)
	public Show getShow() {
		return show;
	}
	public void setShow(Show show) {
		this.show = show;
	}
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "reservation", cascade = CascadeType.ALL)
	public List<Seat> getSeats() {
		return seats;
	}
	public void setSeats(List<Seat> seat) {
		this.seats = seat;
	}
	
	/*@OneToMany(fetch = FetchType.EAGER, mappedBy = "reservation")
	public List<Seat> getSeat() {
		return seat;
	}
	public void setSeat(List<Seat> seat) {
		this.seat = seat;
	}*/

	
}
