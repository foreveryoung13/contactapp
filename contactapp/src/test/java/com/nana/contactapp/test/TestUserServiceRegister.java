package com.nana.contactapp.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.nana.contactapp.config.SpringRootConfig;
import com.nana.contactapp.domain.User;
import com.nana.contactapp.services.UserService;

public class TestUserServiceRegister {

	public static void main(String[] args) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
		UserService userService = ctx.getBean(UserService.class);

		User u = new User();
		u.setName("Nitin");
		u.setPhone("082240255742");
		u.setEmail("nitin@gmail.com");
		u.setAddress("Majalengka");
		u.setLoginName("nitin");
		u.setPassword("123");
		u.setRole(UserService.ROLE_ADMIN); /* Admin Role */
		u.setLoginStatus(UserService.LOGIN_STATUS_ACTIVE); /* Active */
		userService.register(u);
		System.out.println("----------------------------");
	}

}
