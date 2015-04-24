package com.ateam.users.dao;

import java.util.List;

import com.ateam.users.model.UserRole;

public interface RoleDao {

	UserRole findByName(String username);

	Integer createRole(UserRole role);


	List<UserRole> getByUser(String username);

	void deleteRole(UserRole role);
	
	UserRole getRole(UserRole role);

	UserRole getByUserAndRole(String username, String role);


	
}