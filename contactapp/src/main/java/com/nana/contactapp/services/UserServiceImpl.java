package com.nana.contactapp.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.nana.contactapp.dao.BaseDAO;
import com.nana.contactapp.dao.UserDAO;
import com.nana.contactapp.domain.User;
import com.nana.contactapp.exception.UserBlockedException;
import com.nana.contactapp.rm.UserRowMapper;

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
		String sql = "SELECT userId, name, phone, email, address, role, loginStatus, loginName"
				+ " FROM user WHERE loginName =:ln AND password=:pw";

		Map m = new HashMap();
		m.put("ln", loginName);
		m.put("pw", password);

		try {
			User u = getNamedParameterJdbcTemplate().queryForObject(sql, m, new UserRowMapper());
			if (u.getLoginStatus().equals(UserService.LOGIN_STATUS_BLOCKED)) {
				throw new UserBlockedException("Your Account has been blocked, please contact to admin.");
			} else {
				return u;
			}
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}

	}

	@Override
	public List<User> getUserList() {
		return null;
	}

	@Override
	public void changeLoginStatus(Integer userId, Integer status) {

	}

}
