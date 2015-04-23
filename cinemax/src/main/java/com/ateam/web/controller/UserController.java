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

import com.ateam.users.model.User;
import com.ateam.users.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService fs;
	
	
	@RequestMapping(value="/user/add")
	public ModelAndView viewAdd(Model model) {
		User userForm = new User();
		model.addAttribute("userForm", userForm);
		
		return new ModelAndView("addUser");
	}
	
	@RequestMapping(value="/user/add/process")
	public ModelAndView processAdding(@ModelAttribute("userForm") User user) {
		fs.createUser(user);
		
		ModelAndView modelAndView = new ModelAndView("redirect:/redirect");
		
	    
	    return modelAndView;	
	}
	
	
    
    @RequestMapping(value= {"/user/list", "/user"})
    public ModelAndView listOfUsersAdmin() {
        ModelAndView modelAndView = new ModelAndView("usersAdmin");
         
        List<User> users = fs.getUsers();
        modelAndView.addObject("users", users);
         
        return modelAndView;
    }
    
    
    
    @RequestMapping(value="/user/edit/{username}", method=RequestMethod.GET)
    public ModelAndView editUser(@PathVariable String username) {
        ModelAndView modelAndView = new ModelAndView("editUser");
        User user = fs.getUser(username);
        
        modelAndView.addObject("userForm",user);
        return modelAndView;
    }
    
    
    @RequestMapping(value="/user/roles/{username}", method=RequestMethod.GET)
    public ModelAndView getUser(@PathVariable String username) {
        ModelAndView modelAndView = new ModelAndView("UserRoles");
        User user = fs.getUser(username);
        modelAndView.addObject("user",user);
        
        return modelAndView;
    }
    
    @RequestMapping(value="/user/edit/process/{username}", method=RequestMethod.GET)
    public ModelAndView editingFilm(@ModelAttribute("userForm") User user, @PathVariable String username) {
         
        ModelAndView modelAndView = new ModelAndView("redirect:/redirect");
         
        fs.updateUser(user, username);
         
        String message = "User was successfully edited.";
        modelAndView.addObject("message", message);
         
        return modelAndView;
    }
    
    @RequestMapping(value="/user/delete/{username}", method=RequestMethod.GET)
    public ModelAndView deletefilm(@PathVariable String username) {
        ModelAndView modelAndView = new ModelAndView("redirect:/redirect");
        fs.deleteUser(username);
        String message = "User was successfully deleted.";
        modelAndView.addObject("message", message);
        return modelAndView;
    }
}
