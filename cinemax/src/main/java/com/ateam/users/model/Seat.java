package com.ateam.users.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "seats", catalog = "test", uniqueConstraints = @UniqueConstraint(columnNames = { "seat_name", "reservation_id" }))
public class Seat {
	
	private Integer seatId;
	
	private String seatName;
	private Reservation reservation;
	//private List<Show> show = new ArrayList<Show>(0);
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "seat_id", unique = true, nullable = false)
	public Integer getSeatId() {
		return seatId;
	}
	public void setSeatId(Integer seatId) {
		this.seatId = seatId;
	}
	
	@Column(name = "seat_name", unique = true, nullable = false)
	public String getSeatName() {
		return seatName;
	}
	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "reservation_id", nullable = false)
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	
	/*@OneToMany(fetch = FetchType.LAZY, mappedBy = "seat")
	public List<Show> getShow() {
		return show;
	}
	public void setShow(List<Show> show) {
		this.show = show;
	}*/

	
}

