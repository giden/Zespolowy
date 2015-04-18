package com.ateam.users.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;


@Entity
@Table(name = "shows", catalog = "test", uniqueConstraints = @UniqueConstraint(columnNames = { "show_date", "film_id" }))
public class Show {

	private Integer showId;
	private String date;
	private Film film;
	
	private List<Reservation> reservations = new ArrayList<Reservation>(0);

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "show_id", unique = true, nullable = false)
	public Integer getShowId() {
		return showId;
	}
	public void setShowId(Integer showId) {
		this.showId = showId;
	}	
	
	@Column(name = "show_date", nullable = false)
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "film_id", nullable = false)
	public Film getFilm() {
		return film;
	}
	public void setFilm(Film film) {
		this.film = film;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "show")
	public List<Reservation> getReservations() {
		return reservations;
	}
	public void setReservations(List<Reservation> reservation) {
		this.reservations = reservation;
	}
	
	
}
