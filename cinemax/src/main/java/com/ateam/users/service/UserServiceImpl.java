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

		Set<UserRole> roles = new HashSet<UserRole>();
		roles.add(rd.findByName("ROLE_USER"));
		user.setUserRole(roles);

		return ud.createUser(user);
		
	}

}
