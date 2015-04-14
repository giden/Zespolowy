package com.ateam.users.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "seats", catalog = "test")
public class Seat {
	
	private Integer seatId;
	
	private Integer seatNumber;
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
	
	@Column(name = "seatnumber", unique = true, nullable = false)
	public Integer getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(Integer seatNumber) {
		this.seatNumber = seatNumber;
	}
	
	/*@OneToMany(fetch = FetchType.LAZY, mappedBy = "seat")
	public List<Show> getShow() {
		return show;
	}
	public void setShow(List<Show> show) {
		this.show = show;
	}*/

	
}

