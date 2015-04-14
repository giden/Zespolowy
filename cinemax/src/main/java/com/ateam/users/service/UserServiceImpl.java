package com.ateam.users.service;

import java.util.HashSet;
import java.util.Set;

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

}
