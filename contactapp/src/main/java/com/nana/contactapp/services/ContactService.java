package com.nana.contactapp.services;

import java.util.List;

import com.nana.contactapp.domain.Contact;

public interface ContactService {

	public void save (Contact c);
	public void update(Contact c);
	public void delete(Integer contactId);
	public Contact findById(Integer contactId);
	public void delete(Integer[] contactIds);
	public List<Contact> findUserContact(Integer userId);
	public List<Contact> findUserContact(Integer userId, String txt);
	
}
