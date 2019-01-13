package com.nana.contactapp.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.nana.contactapp.config.SpringRootConfig;
import com.nana.contactapp.dao.UserDAO;
import com.nana.contactapp.domain.User;

public class TestUserDAOFindAll {

	public static void main(String[] args) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
		UserDAO userDAO = ctx.getBean(UserDAO.class);

		User u = userDAO.findById(3);
		
		System.out.println("----------------------------");
		System.out.println(u.getUserId());
		System.out.println(u.getName());
		System.out.println(u.getPhone());
		System.out.println(u.getEmail());
		System.out.println(u.getAddress());
		System.out.println(u.getLoginStatus());
	}

}
