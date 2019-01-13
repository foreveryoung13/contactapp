package com.nana.contactapp.test;


import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.nana.contactapp.config.SpringRootConfig;
import com.nana.contactapp.dao.ContactDAO;
import com.nana.contactapp.domain.Contact;

public class TestContactDAOFindAll {

	public static void main(String[] args) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
		ContactDAO ContactDAO = ctx.getBean(ContactDAO.class);

		Contact u = ContactDAO.findById(1);

		System.out.println();
		System.out.println(u.getName());
		System.out.println(u.getPhone());
		System.out.println(u.getEmail());
		System.out.println(u.getAddress());
		System.out.println(u.getRemark());
		System.out.println();

	}

}
