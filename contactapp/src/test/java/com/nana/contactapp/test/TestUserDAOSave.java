package com.nana.contactapp.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.nana.contactapp.config.SpringRootConfig;
import com.nana.contactapp.dao.UserDAO;
import com.nana.contactapp.domain.User;

public class TestUserDAOSave {

	public static void main(String[] args) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
		UserDAO userDAO = ctx.getBean(UserDAO.class);

		User u = new User();
		u.setName("Nana");
		u.setPhone("082240255749");
		u.setEmail("nana.febriana@gmail.com");
		u.setAddress("jakarta");
		u.setLoginName("nana");
		u.setPassword("123");
		u.setRole(1); /* Admin Role */
		u.setLoginStatus(1); /* Active */
		userDAO.save(u);
		System.out.println("----------------------------");
	}

}
