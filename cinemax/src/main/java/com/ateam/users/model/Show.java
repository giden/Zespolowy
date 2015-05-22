package com.ateam.users.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
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
	private String dateDay;
	
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
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "show", cascade = CascadeType.ALL)
	public List<Reservation> getReservations() {
		return reservations;
	}
	public void setReservations(List<Reservation> reservation) {
		this.reservations = reservation;
	}
	@Column(name = "show_day", nullable = true)
	public String getDateDay() {
		
		return dateDay;
		
	}
	
	public void setDateDayFunction(String date) {
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-mm-dd");
	    Date date2;
		try {
			date2 = sd.parse(date);
		
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date2);
	    
	    
	    int day = calendar.get(Calendar.DAY_OF_WEEK);
	    System.out.println("aa" + day);
	    
	    switch (day) {
	    case 1: this.dateDay = "Poniedzialek"; break;
	    case 2: this.dateDay = "Wtorek"; break;
	    case 3: this.dateDay = "Sroda"; break;
	    case 4: this.dateDay = "Czwartek"; break;
	    case 5: this.dateDay = "Piatek"; break;
	    case 6: this.dateDay = "Sobota";break;
	    case 0: this.dateDay = "Niedziela";break;

	    }
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
	}
	

	
	
}
	public void setDateDay(String dateDay) {
		this.dateDay = dateDay;
	}

}