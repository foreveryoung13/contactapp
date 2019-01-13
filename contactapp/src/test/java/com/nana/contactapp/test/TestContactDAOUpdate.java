package com.nana.contactapp.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.nana.contactapp.config.SpringRootConfig;
import com.nana.contactapp.dao.ContactDAO;
import com.nana.contactapp.domain.Contact;

public class TestContactDAOUpdate {

	public static void main(String[] args) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
		ContactDAO ContactDAO = ctx.getBean(ContactDAO.class);

		Contact u = new Contact();
		u.setContactId(1);
		u.setName("Rohman");
		u.setPhone("082240256771");
		u.setEmail("rohman@gmail.com");
		u.setAddress("baleendah");
		u.setRemark("remark 2");
		ContactDAO.update(u);
		System.out.println("----------------------------");
	}

}
