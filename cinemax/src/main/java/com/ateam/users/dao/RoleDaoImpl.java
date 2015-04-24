package com.ateam.users.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	@Override
	public Integer createRole(UserRole role) {
		return (Integer) sessionFactory.getCurrentSession().save(role);

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<UserRole> getByUser(String username) {
        return sessionFactory.getCurrentSession().createQuery("from UserRole where user.username=?").setParameter(0, username).list();
	}

	@Override
	public void deleteRole(UserRole role) {
		UserRole ur = getRole(role);
        if (ur != null)
        	sessionFactory.getCurrentSession().delete(ur);
		
	}

	public UserRole getRole(UserRole role) {
		UserRole ur = (UserRole) sessionFactory.getCurrentSession().get(UserRole.class, role.getUserRoleId());
	    return ur;
	}

	@SuppressWarnings("unchecked")
	@Override
	public UserRole getByUserAndRole(String username, String role) {
		List<UserRole> roles = new ArrayList<UserRole>();

		roles =  sessionFactory.getCurrentSession().createQuery("from UserRole where user.username=? and role=?").setParameter(0, username).setParameter(1, role).list();
        
		if (roles.size() > 0) {
			return roles.get(0);
		} else {
			return null;
		}
        
	}



}