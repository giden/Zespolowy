package com.ateam.web.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.users.model.User;
import com.ateam.users.service.UserService;

@Controller
public class MainController {

	@Autowired
	UserService us;

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security + Hibernate Example");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("admin");

		return model;

	}
	


	@RequestMapping(value = "/rezerwacje**", method = RequestMethod.GET)
	public ModelAndView reservationPage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("rezerwacje");

		return model;

	}
	
	@RequestMapping(value = "/dane**", method = RequestMethod.GET)
	public ModelAndView dataPage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("dane");

		return model;

	}
	
	@RequestMapping(value = "/redirect**", method = RequestMethod.GET)
	public ModelAndView redirectPage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("redirect");
		
		String message = "Film was successfully added.";
	    model.addObject("message", message);

		return model;

	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}

	// customize the error message
	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession().getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Invalid username and password!";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else {
			error = "Invalid username and password!";
		}

		return error;
	}

	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;

	}
	
	
	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView viewRegistration(Model model) {
        User userForm = new User();    
        model.addAttribute("userForm", userForm);

         
        return new ModelAndView("register");
    }
     
    @RequestMapping(value = "/register/process", method = RequestMethod.GET)
    public ModelAndView processRegistration(@ModelAttribute("userForm") User user,
            Map<String, Object> model) {
         
    	us.createUser(user);
    	
        // for testing purpose:
        System.out.println("username: " + user.getUsername());
        System.out.println("password: " + user.getPassword());
         
        return new ModelAndView("filmy");
    }
	

}