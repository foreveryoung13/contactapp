package com.nana.contactapp.dao;

import java.util.List;

import com.nana.contactapp.domain.Contact;

public interface ContactDAO {
	
	public void save(Contact u);
	public void update(Contact u);
	public void delete(Contact u);
	public void delete(Integer contactId);
	public Contact findById(Integer contactId);
	public List<Contact> findAll();
	public List<Contact> findByProperty(String propName, Object propValue);
}
