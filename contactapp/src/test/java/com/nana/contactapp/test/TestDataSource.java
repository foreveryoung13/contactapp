package com.nana.contactapp.test;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.nana.contactapp.config.SpringRootConfig;

public class TestDataSource {

	public static void main(String[] args) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
		DataSource ds = ctx.getBean(DataSource.class);
		JdbcTemplate jt = new JdbcTemplate(ds);
		String sql = "INSERT INTO user(`name`, `phone`, `email`, `address`, `loginName`, `password`)"
				+ "VALUES (?,?,?,?,?,?)";
		Object[] param = new Object[] { "Vikram", "0822-4025-5749", "vikram@ezeon.net", "Bhoval", "v", "v123" };
		jt.update(sql,param);
		
		System.out.println("--------------------SQL EXECUTED----------------------");
	}
}
