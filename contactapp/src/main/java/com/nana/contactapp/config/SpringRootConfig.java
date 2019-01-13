package com.nana.contactapp.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = { "com.nana.contactapp.dao","com.nana.contactapp.services" })
public class SpringRootConfig {
	/* TODO: Services, DAO, DataSource, Email Sender or some other business layer beans */
	
	@Bean
	public BasicDataSource getDataSource() {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
//		ds.setUrl("jdbc:/mysql://localhost:3306/capp_db");
		ds.setUrl("jdbc:mysql://localhost:3306/capp_db?useSSL=false");
		ds.setUsername("root");
		ds.setPassword("password.1");
		ds.setMaxTotal(2);
		ds.setInitialSize(1);
		ds.setTestOnBorrow(true);
		ds.setValidationQuery("SELECT 1");
		ds.setDefaultAutoCommit(true);
		return ds;
	}
	
}
