package com.ateam.users.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ateam.users.dao.RoleDao;
import com.ateam.users.dao.UserDao;
import com.ateam.users.model.User;
import com.ateam.users.model.UserRole;

@Service("userService")
public class UserServiceImpl implements UserService {

	
	@Autowired
	private UserDao ud;
	
	@Autowired 
	private RoleDao rd;
	
	@Override
	@Transactional
	public String createUser(User user) {
		
		user.setEnabled(true);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));

		String id = ud.createUser(user);
	
		UserRole role = new UserRole();
		role.setRole("ROLE_USER");
		role.setUser(user);
		
		rd.createRole(role);

		return id;
		
	}
	@Override
	@Transactional
	public void updateUser(User user, String username) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));
		
		ud.updateUser(user, username);
	}
	
	@Override
	@Transactional
	public User getUser(String username) {
		return ud.getUser(username);
	}
	
	@Override
	@Transactional
	public void deleteUser(String username) {
		ud.deleteUser(username);
	}
	
	@Override
	@Transactional
	public List<User> getUsers(){
		
		return ud.getUsers();
	}
	
	

}
