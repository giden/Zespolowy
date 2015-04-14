package com.ateam.users.dao;

import com.ateam.users.model.UserRole;

public interface RoleDao {

	UserRole findByName(String username);

	Integer createRole(UserRole role);

	
}