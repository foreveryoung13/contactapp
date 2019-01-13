package com.nana.contactapp.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.nana.contactapp.config.SpringRootConfig;
import com.nana.contactapp.dao.UserDAO;
import com.nana.contactapp.domain.User;

public class TestUserDAOUpdate {

	public static void main(String[] args) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
		UserDAO userDAO = ctx.getBean(UserDAO.class);

		User u = new User();
		u.setUserId(2);
		u.setName("Febriana");
		u.setPhone("082240255748");
		u.setEmail("febriana@gmail.com");
		u.setAddress("subang");
		u.setRole(1); /* Admin Role */
		u.setLoginStatus(1); /* Active */
		userDAO.update (u);
		System.out.println("----------------------------");
	}

}
