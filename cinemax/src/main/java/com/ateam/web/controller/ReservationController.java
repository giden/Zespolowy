package com.ateam.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.users.model.Reservation;
import com.ateam.users.model.Show;
import com.ateam.users.service.ReservationService;
import com.springsource.tcserver.serviceability.Constants;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService fs;
	
	

	@RequestMapping(value = "/sala/{show_id}", method = RequestMethod.GET)
	public ModelAndView salePage(@PathVariable Integer show_id, HttpSession session) {

		ModelAndView model = new ModelAndView();
		model.setViewName("sala");
		
		Show show = fs.getShowById(show_id);
        model.addObject("show", show);

		
		session.setAttribute("show", show_id);

		return model;

	}
	
	@RequestMapping(value="/sala/add/process/{seat}")
	public ModelAndView processAdding(@PathVariable Integer seat, HttpSession session) {
		//fs.addReservation(reservation);
		//model.addAttribute("reservationForm", reservation);
		
		Reservation reservation = new Reservation();
		
		reservation.setSeat(seat);
		
		session.setAttribute("REZERWACJA", reservation);

		ModelAndView modelAndView = new ModelAndView("dane");
		
		Show show = fs.getShowById((Integer) session.getAttribute("show"));

		modelAndView.addObject("reservationFormNext", reservation);
		modelAndView.addObject("show", show);

	    
	    return modelAndView;	
	}
	
	@RequestMapping(value="/sala/add/process/next")
	public ModelAndView processAddingNext(@ModelAttribute("reservationFormNext") Reservation reservation, HttpSession session) {
		
		Reservation allReservation = (Reservation) session.getAttribute("REZERWACJA");
		
		reservation.setSeat(allReservation.getSeat());
		
		
		Show show = fs.getShowById((Integer) session.getAttribute("show"));
		
		reservation.setShow(show);
		
		fs.addReservation(reservation);
		
		
		ModelAndView modelAndView = new ModelAndView("redirect:/reservation/list");
		
	    
	    return modelAndView;	
	}
	
	 
    @RequestMapping(value="/reservation/list")
    public ModelAndView listOfTeams() {
        ModelAndView modelAndView = new ModelAndView("rezerwacje");
         
        List<Reservation> reservations = fs.getReservations();
        modelAndView.addObject("reservations", reservations);
         
        return modelAndView;
    }
    
    
    
    /*@RequestMapping(value= {"/reservation/list", "/reservation"})
    public ModelAndView listOfTeamsAdmin() {
        ModelAndView modelAndView = new ModelAndView("reservationAdmin");
         
        List<Reservation> reservations = fs.getReservations();
        modelAndView.addObject("reservations", reservations);
         
        return modelAndView;
    }*/
    
    
    
    @RequestMapping(value="/reservation/edit/{id}", method=RequestMethod.GET)
    public ModelAndView editReservation(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("editReservation");
        Reservation reservation = fs.getReservation(id);
        
        modelAndView.addObject("reservation",reservation);
        return modelAndView;
    }
    
    @RequestMapping(value="/reservation/edit/process/{id}", method=RequestMethod.GET)
    public ModelAndView editingReservation(@ModelAttribute Reservation reservation, @PathVariable Integer id) {
         
        ModelAndView modelAndView = new ModelAndView("redirect:/reservation/list");
         
        fs.updateReservation(reservation, id);
         
        String message = "Reservation was successfully edited.";
        modelAndView.addObject("message", message);
         
        return modelAndView;
    }
    
    @RequestMapping(value="/reservation/delete/{id}", method=RequestMethod.GET)
    public ModelAndView deletereservation(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("redirect:/reservation/list");
        fs.deleteReservation(id);
        String message = "Reservation was successfully deleted.";
        modelAndView.addObject("message", message);
        return modelAndView;
    }
}
