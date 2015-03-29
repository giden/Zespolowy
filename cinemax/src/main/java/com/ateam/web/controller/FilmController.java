package com.ateam.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.users.model.Film;
import com.ateam.users.service.FilmService;

@Controller
public class FilmController {
	
	@Autowired
	private FilmService fs;
	
	
	@RequestMapping(value="/film/add")
	public ModelAndView viewAdd(Model model) {
		Film filmForm = new Film();
		model.addAttribute("filmForm", filmForm);
		
		return new ModelAndView("addFilm");
	}
	
	@RequestMapping(value="/film/add/process")
	public ModelAndView processAdding(@ModelAttribute("filmForm") Film film) {
		fs.addFilm(film);
		
		ModelAndView modelAndView = new ModelAndView("redirect:/redirect");
		
	    
	    return modelAndView;	
	}
	
	 
    @RequestMapping(value="/")
    public ModelAndView listOfTeams() {
        ModelAndView modelAndView = new ModelAndView("filmy");
         
        List<Film> films = fs.getFilms();
        modelAndView.addObject("films", films);
         
        return modelAndView;
    }
    
    @RequestMapping(value= {"/film/list", "/film"})
    public ModelAndView listOfTeamsAdmin() {
        ModelAndView modelAndView = new ModelAndView("filmyAdmin");
         
        List<Film> films = fs.getFilms();
        modelAndView.addObject("films", films);
         
        return modelAndView;
    }
    
    
    
    @RequestMapping(value="/film/edit/{id}", method=RequestMethod.GET)
    public ModelAndView editFilm(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("editFilm");
        Film film = fs.getFilm(id);
        
        modelAndView.addObject("film",film);
        return modelAndView;
    }
    
    @RequestMapping(value="/film/edit/process/{id}", method=RequestMethod.GET)
    public ModelAndView editingFilm(@ModelAttribute Film film, @PathVariable Integer id) {
         
        ModelAndView modelAndView = new ModelAndView("redirect:/redirect");
         
        fs.updateFilm(film, id);
         
        String message = "Film was successfully edited.";
        modelAndView.addObject("message", message);
         
        return modelAndView;
    }
    
    @RequestMapping(value="/film/delete/{id}", method=RequestMethod.GET)
    public ModelAndView deletefilm(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("redirect:/redirect");
        fs.deleteFilm(id);
        String message = "Film was successfully deleted.";
        modelAndView.addObject("message", message);
        return modelAndView;
    }
}
