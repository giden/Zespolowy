package com.ateam.users.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;


@Entity
@Table(name = "shows", catalog = "test", uniqueConstraints = @UniqueConstraint(columnNames = { "date", "filmname" }))
public class Show {

	private Integer showId;
	private Date date;
	private Film film;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "show_id", unique = true, nullable = false)
	public Integer getShowId() {
		return showId;
	}
	public void setShowId(Integer showId) {
		this.showId = showId;
	}	
	
	@Column(name = "date", nullable = false)
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "filmname", nullable = false)
	public Film getFilm() {
		return film;
	}
	public void setFilm(Film film) {
		this.film = film;
	}
	
	
}
