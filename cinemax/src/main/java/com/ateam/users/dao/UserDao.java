package com.ateam.users.dao;

import com.ateam.users.model.User;

public interface UserDao {

	User findByUserName(String username);

}