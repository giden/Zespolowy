package com.ateam.users.service;

import java.util.List;

import com.ateam.users.model.User;
import com.ateam.users.model.UserRole;

public interface UserService {

	public String createUser(User user);


	void updateUser(User user, String username);


	User getUser(String username);


	void deleteUser(String username);


	List<User> getUsers();


	List<UserRole> getRoles(String username);


	void deleteRole(String role, String username);


	void createRole(UserRole role);
}
