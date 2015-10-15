package com.ateam.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.users.model.Film;
import com.ateam.users.model.Show;
import com.ateam.users.service.ShowService;

@Controller
public class ShowController {
	
	@Autowired
	private ShowService fs;
	
	
	@RequestMapping(value="/show/add")
	public ModelAndView viewAdd(Model model) {
		
        ModelAndView modelAndView = new ModelAndView("addShowFilm");

		 List<Film> films = fs.getFilms();
	        modelAndView.addObject("films", films);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/show/add/{filmId}")
	public ModelAndView viewAdd2(@PathVariable Integer filmId, HttpSession session) {
		ModelAndView model = new ModelAndView("addShow");
		Show showForm = new Show();
		session.setAttribute("filmId", filmId);
		model.addObject("showForm", showForm);
        String message = "Show was successfully added.";
        session.setAttribute("message", message);

		return model;
	}
	
	@RequestMapping(value="/show/add/process")
	public ModelAndView processAdding(@ModelAttribute("showForm") Show show, HttpSession session) {
		Integer filmId=(Integer) session.getAttribute("filmId");
		show.setFilm(fs.getFilmById(filmId));

		fs.addShow(show);
		
		ModelAndView modelAndView = new ModelAndView("redirect:/redirect");
		
	    
	    return modelAndView;	
	}
	
	 
    
    
    @RequestMapping(value= {"/show/list", "/show"})
    public ModelAndView listOfTeamsAdmin() {
        ModelAndView modelAndView = new ModelAndView("showsAdmin");
         
        List<Show> shows = fs.getShows();
        modelAndView.addObject("shows", shows);
         
        return modelAndView;
    }
    
    
    
    @RequestMapping(value="/show/edit/{id}", method=RequestMethod.GET)
    public ModelAndView editShow(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("editShow");
        Show show = fs.getShow(id);
        
        modelAndView.addObject("show",show);
        return modelAndView;
    }
    
    @RequestMapping(value="/show/edit/process/{id}", method=RequestMethod.GET)
    public ModelAndView editingShow(@ModelAttribute Show show, @PathVariable Integer id, HttpSession session) {
         
        ModelAndView modelAndView = new ModelAndView("redirect:/redirect");
         
        fs.updateShow(show, id);
         
        String message = "Show was successfully edited.";
        session.setAttribute("message", message);
         
        return modelAndView;
    }
    
    @RequestMapping(value="/show/delete/{id}", method=RequestMethod.GET)
    public ModelAndView deleteShow(@PathVariable Integer id, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("redirect:/redirect");
        fs.deleteShow(id);
        String message = "Show was successfully deleted.";
        session.setAttribute("message", message);
        return modelAndView;
    }
}
