package com.ateam.users.dao;

import java.util.List;

import com.ateam.users.model.User;

public interface UserDao {

	User findByUserName(String username);

	String createUser(User user);

	void updateUser(User user, String username);

	User getUser(String id);

	List<User> getUsers();

	void deleteUser(String id);
	
	
}