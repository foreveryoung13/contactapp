package com.nana.contactapp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nana.contactapp.dao.BaseDAO;
import com.nana.contactapp.dao.UserDAO;
import com.nana.contactapp.domain.User;
import com.nana.contactapp.exception.UserBlockedException;

@Service
public class UserServiceImpl extends BaseDAO implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public void register(User u) {
		userDAO.save(u);
	}

	@Override
	public User login(String loginName, String password) throws UserBlockedException {
		return null;
	}

	@Override
	public List<User> getUserList() {
		return null;
	}

	@Override
	public void changeLoginStatus(Integer userId, Integer status) {

	}

}
