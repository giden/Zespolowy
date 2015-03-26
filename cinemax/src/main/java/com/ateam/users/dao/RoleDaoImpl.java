package com.ateam.users.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ateam.users.model.User;
import com.ateam.users.model.UserRole;

@Repository
public class RoleDaoImpl implements RoleDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public UserRole findByName(String name) {

		List<UserRole> roles = new ArrayList<UserRole>();

		roles = sessionFactory.getCurrentSession().createQuery("from UserRole where role=?").setParameter(0, name).list();

		if (roles.size() > 0) {
			return roles.get(0);
		} else {
			return null;
		}

	}


}