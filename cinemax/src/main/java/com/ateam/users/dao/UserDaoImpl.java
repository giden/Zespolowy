package com.ateam.users.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ateam.users.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public User findByUserName(String username) {

		List<User> users = new ArrayList<User>();

		users = sessionFactory.getCurrentSession().createQuery("from User where username=?").setParameter(0, username)
				.list();

		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}

	}

	@Override
	public String createUser(User user) {
		return (String) sessionFactory.getCurrentSession().save(user);

	}
	
	@Override
	public void updateUser(User user, String username) {
		User userToUpdate = getUser(username);
        userToUpdate.setEmail(user.getEmail());
        if(!user.getPassword().isEmpty()) {
        userToUpdate.setPassword(user.getPassword());}
        userToUpdate.setPhone(user.getPhone());
        userToUpdate.setSurname(user.getSurname());
        userToUpdate.setName(user.getName());
        sessionFactory.getCurrentSession().update(userToUpdate);
		
	}

	@Override
	public User getUser(String id) {
		User user = (User) sessionFactory.getCurrentSession().get(User.class, id);
	    return user;
	}

	@Override
	public void deleteUser(String id) {
		User user = getUser(id);
	        if (user != null)
	        	sessionFactory.getCurrentSession().delete(user);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUsers() {
        return sessionFactory.getCurrentSession().createQuery("from User").list();
	}


}