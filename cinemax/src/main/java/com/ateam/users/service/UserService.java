package com.ateam.users.service;

import java.util.List;

import com.ateam.users.model.User;

public interface UserService {

	public String createUser(User user);


	void updateUser(User user, String username);


	User getUser(String username);


	void deleteUser(String username);


	List<User> getUsers();
}
