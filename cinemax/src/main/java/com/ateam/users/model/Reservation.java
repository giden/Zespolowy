package com.ateam.users.model;

//import java.sql.Date;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "reservations", catalog = "test")
public class Reservation {
	
	private Integer reservationId;
	
	private Integer seat;
	private String name, surname, email, phone;
	private Date date = new Date();
	
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
	
	@Column(name = "reservationseat", unique = true, nullable = false)
	public Integer getSeat() {
		return seat;
	}
	public void setSeat(Integer seat) {
		this.seat = seat;
	}
	
	@Column(name = "reservationdate", unique = false, nullable = true)
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "show_id", nullable = false)
	public Show getShow() {
		return show;
	}
	public void setShow(Show show) {
		this.show = show;
	}
	
	/*@OneToMany(fetch = FetchType.EAGER, mappedBy = "reservation")
	public List<Seat> getSeat() {
		return seat;
	}
	public void setSeat(List<Seat> seat) {
		this.seat = seat;
	}*/

	
}
