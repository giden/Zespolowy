package com.ateam.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.users.model.User;
import com.ateam.users.model.UserRole;
import com.ateam.users.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService us;
	
	
	@RequestMapping(value="/user/add")
	public ModelAndView viewAdd(Model model) {
		User userForm = new User();
		model.addAttribute("userForm", userForm);
		
		return new ModelAndView("addUser");
	}
	
	@RequestMapping(value="/user/add/process")
	public ModelAndView processAdding(@ModelAttribute("userForm") User user, HttpSession session) {
		us.createUser(user);
		
		ModelAndView modelAndView = new ModelAndView("redirect:/redirectUsers");
        String message = "User was successfully added.";
        session.setAttribute("message", message);

	    
	    return modelAndView;	
	}
	
	
    
    @RequestMapping(value= {"/user/list", "/user"})
    public ModelAndView listOfUsersAdmin() {
        ModelAndView modelAndView = new ModelAndView("usersAdmin");
         
        List<User> users = us.getUsers();
        modelAndView.addObject("users", users);
         
        return modelAndView;
    }
    
    
    
    @RequestMapping(value="/user/edit/{username}", method=RequestMethod.GET)
    public ModelAndView editUser(@PathVariable String username) {
        ModelAndView modelAndView = new ModelAndView("editUser");
        User user = us.getUser(username);
        
        
        modelAndView.addObject("userForm",user);
        return modelAndView;
    }
    
    @RequestMapping(value="/profile/edit", method=RequestMethod.GET)
    public ModelAndView editUserbyUser() {
        ModelAndView modelAndView = new ModelAndView("editUser");

    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userName =  auth.getName();
    	
    	        User user = us.getUser(userName);
        
        
        modelAndView.addObject("userForm",user);
        return modelAndView;
    }
    
    
    @RequestMapping(value="/user/roles/{username}", method=RequestMethod.GET)
    public ModelAndView getUser(@PathVariable String username) {
        ModelAndView modelAndView = new ModelAndView("UserRoles");
        User user = us.getUser(username);
        modelAndView.addObject("user",user);
        
        List<UserRole> roles = us.getRoles(username);

        modelAndView.addObject("roles",roles);

        
        return modelAndView;
    }
    
    @RequestMapping(value="/user/edit/process/{username}", method=RequestMethod.GET)
    public ModelAndView editingFilm(@ModelAttribute("userForm") User user, @PathVariable String username, HttpSession session) {
         
        ModelAndView modelAndView = new ModelAndView("redirect:/redirectUsers");
         
        us.updateUser(user, username);
         
        String message = "User was successfully edited.";
        session.setAttribute("message", message);
         
        return modelAndView;
    }
    
    @RequestMapping(value="/profile/process/{username}", method=RequestMethod.GET)
    public ModelAndView editingUserbyUser(@ModelAttribute("userForm") User user, @PathVariable String username, HttpSession session) {
         
        ModelAndView modelAndView = new ModelAndView("redirect:/");
         
        us.updateUser(user, username);
         
        String message = "User was successfully edited.";
        session.setAttribute("message", message);
         
        return modelAndView;
    }
    
    @RequestMapping(value="/user/delete/{username}", method=RequestMethod.GET)
    public ModelAndView deletefilm(@PathVariable String username, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("redirect:/redirectUsers");
        us.deleteUser(username);
        String message = "User was successfully deleted.";
        session.setAttribute("message", message);
        return modelAndView;
    }
    
    @RequestMapping(value="/user/roles/delete/{username}/{role}", method=RequestMethod.GET)
    public ModelAndView deleteUserRole(@PathVariable("role") String role, 
    		@PathVariable("username") String username, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("redirect:/redirectUsers");
        us.deleteRole(role, username);
        String message = "Role was successfully deleted.";
        session.setAttribute("message", message);
        return modelAndView;
    }
    @RequestMapping(value="/user/roles/add/{username}")
	public ModelAndView viewAddRole(@PathVariable String username, Model model, HttpSession session) {
		UserRole roleForm = new UserRole();
		model.addAttribute("roleForm", roleForm);
		
		session.setAttribute("username", username);
		
		return new ModelAndView("addRole");
	}
	
	@RequestMapping(value="/user/roles/add/process")
	public ModelAndView processAddingRole(@ModelAttribute("roleForm") UserRole role, HttpSession session) {
		
		User user = new User();
		user = us.getUser((String) session.getAttribute("username"));
		role.setUser(user);
		us.createRole(role);
		
		ModelAndView modelAndView = new ModelAndView("redirect:/redirectUsers");
        String message = "Role was successfully added.";
        session.setAttribute("message", message);

	    
	    return modelAndView;	
	}
}
