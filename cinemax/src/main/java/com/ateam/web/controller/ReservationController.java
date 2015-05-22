package com.ateam.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.users.model.Reservation;
import com.ateam.users.model.Seat;
import com.ateam.users.model.Show;
import com.ateam.users.model.UserRole;
import com.ateam.users.service.ReservationService;
import com.ateam.users.service.SeatService;
import com.ateam.users.service.UserService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rs;
	
	@Autowired
	private SeatService ss;
	
	@Autowired
	private UserService us;
	
	

	@RequestMapping(value = "/sala/{show_id}", method = RequestMethod.GET)
	public ModelAndView salePage(@PathVariable Integer show_id, HttpSession session) {

		ModelAndView model = new ModelAndView();
		model.setViewName("sala");
		
		Show show = rs.getShowById(show_id);
        model.addObject("show", show);
        
        List<Reservation> reservations = ss.getReservationsByShow(show_id);
        List<Seat> seats = new ArrayList<Seat>(); 
        
        for(int i=0; i<reservations.size(); i++) {
        	seats.addAll(ss.getSeatsReservation(reservations.get(i))); 
        }

        model.addObject("lista", seats);
		session.setAttribute("show", show_id);

		return model;

	}
	
	@RequestMapping(value="/sala/add/process")
	public ModelAndView processAdding(HttpSession session, HttpServletRequest request) {
		
		
		Reservation reservation = new Reservation();
		session.setAttribute("REZERWACJA", reservation);

		ModelAndView modelAndView = new ModelAndView("dane");
		
		Show show = rs.getShowById((Integer) session.getAttribute("show"));
		

		modelAndView.addObject("reservationFormNext", reservation);
		modelAndView.addObject("show", show);
		List<String> miejsca = new ArrayList<String>();
		for(int i=1; i<=155; i++) {
			if(request.getParameter(i+"s")!=null)
			miejsca.add(request.getParameter(i+"s"));
		}
		session.setAttribute("MIEJSCA", miejsca);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userName =  auth.getName();
		
		
		com.ateam.users.model.User user = us.getUser(userName);
		
		if (user != null) {
		modelAndView.addObject("surname", user.getSurname());
		modelAndView.addObject("phone", user.getPhone());
		modelAndView.addObject("email", user.getEmail());
		modelAndView.addObject("name", user.getName());

		}
		

	    
	    return modelAndView;	
	}
	
	@RequestMapping(value="/sala/add/process/next")
	public ModelAndView processAddingNext(@ModelAttribute("reservationFormNext") Reservation reservation, HttpSession session) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userName =  auth.getName();

		
		@SuppressWarnings("unchecked")
		List<String> miejsca = (List<String>) session.getAttribute("MIEJSCA");
		
		
		Show show = rs.getShowById((Integer) session.getAttribute("show"));
		
		reservation.setShow(show);
		reservation.setUsername(userName);
		
		Seat seat = new Seat();
		
		
		
		
		int idd=rs.addReservation(reservation);
		
		for(int i=0; i<miejsca.size(); i++) {
		seat.setSeatId(null);
		seat.setSeatName(miejsca.get(i));
		
		seat.setReservation(rs.getReservation(idd));
		
		ss.addSeat(seat);
		}
		
		
		ModelAndView modelAndView = new ModelAndView("redirect:/");


		for (UserRole rola : us.getRoles(userName)) {
			if(rola.getRole().equals("ROLE_USER"))
			modelAndView.setViewName("redirect:/profile/list");
		}
				

		for (UserRole rola : us.getRoles(userName)) {
			if(rola.getRole().equals("ROLE_EMPLOYEE"))
			modelAndView.setViewName("redirect:/reservation/list");
		}
				
	    
	    return modelAndView;	
	}
	
	 
    @RequestMapping(value="/reservation/list")
    public ModelAndView listOfReservations() {
        ModelAndView modelAndView = new ModelAndView("rezerwacje");
        Reservation reservation = new Reservation();
         
        List<Reservation> reservations = rs.getReservations();
        modelAndView.addObject("reservations", reservations);
        modelAndView.addObject("reservation", reservation);

         
        return modelAndView;
    }
    
    @RequestMapping(value="/profile/list")
    public ModelAndView listOfReservationsUser() {
        ModelAndView modelAndView = new ModelAndView("rezerwacje");
        
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userName =  auth.getName();

         
        List<Reservation> reservations = rs.getReservationsUser(userName);
        modelAndView.addObject("reservations", reservations);

         
        return modelAndView;
    }

    
    
    
    
    @RequestMapping(value="/reservation/edit/{id}", method=RequestMethod.GET)
    public ModelAndView editReservation(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("editReservation");
        Reservation reservation = rs.getReservation(id);
        
        modelAndView.addObject("reservation",reservation);
        return modelAndView;
    }
    
    @RequestMapping(value="/reservation/edit/process/{id}", method=RequestMethod.GET)
    public ModelAndView editingReservation(@ModelAttribute Reservation reservation, @PathVariable Integer id) {
         
        ModelAndView modelAndView = new ModelAndView("redirect:/reservation/list");
         
        rs.updateReservation(reservation, id);
         
        String message2 = "Reservation was successfully edited.";
        modelAndView.addObject("message2", message2);
         
        return modelAndView;
    }
    
    @RequestMapping(value="/reservation/delete/{id}", method=RequestMethod.GET)
    public ModelAndView deletereservation(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("redirect:/reservation/list");
        rs.deleteReservation(id);
        String message2 = "Reservation was successfully deleted.";
        modelAndView.addObject("message2", message2);
        return modelAndView;
    }
    
    
    @RequestMapping(value="/reservation/search")
    public ModelAndView searchRes (@ModelAttribute Reservation reservation) {
        ModelAndView modelAndView = new ModelAndView("rezerwacje");

    	
    	List<Reservation> reservations = rs.getReservationsClient(reservation.getSurname());
    	
        modelAndView.addObject("reservations", reservations);
        modelAndView.addObject("reservation", reservation);

    	
		return modelAndView;
    	
    }
    
}


