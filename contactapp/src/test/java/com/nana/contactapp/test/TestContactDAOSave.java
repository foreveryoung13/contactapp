package com.nana.contactapp.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.nana.contactapp.config.SpringRootConfig;
import com.nana.contactapp.dao.ContactDAO;
import com.nana.contactapp.domain.Contact;

public class TestContactDAOSave {

	public static void main(String[] args) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
		ContactDAO ContactDAO = ctx.getBean(ContactDAO.class);

		Contact u = new Contact();
		u.setUserId(1);
		u.setName("Wina");
		u.setPhone("082240256776");
		u.setEmail("wina@gmail.com");
		u.setAddress("karawang");
		u.setRemark("remark 2");
		ContactDAO.save(u);
	}

}
