package com.nana.contactapp.controller;

import org.apache.log4j.Logger;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nana.contactapp.domain.Contact;
import com.nana.contactapp.services.ContactService;

@Controller
public class ContactController {

	final static Logger logger = Logger.getLogger(ContactController.class);
	
	@Autowired
	private ContactService contactService;

	@RequestMapping(value = { "/user/contact_form" })
	public String contactForm(Model m) {
		logger.info("----------------------------------------------------------------");
		Contact contact = new Contact();
		m.addAttribute("command", contact);
		return "contact_form";
	}

	@RequestMapping(value = { "/user/edit_contact" })
	public String prepareEditForm(Model m, HttpSession session, @RequestParam("cid") Integer contactId) {
		session.setAttribute("aContactId", contactId);
		Contact c = contactService.findById(contactId);
		if (c != null) {
			m.addAttribute("command", c);
		} else {
			m.addAttribute("err", "can't find data with id = " + contactId);
		}
		return "contact_form";
	}

	@RequestMapping(value = { "/user/save_contact" })
	public String saveContact(@ModelAttribute("command") Contact c, Model m, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		Integer aContactId = (Integer) session.getAttribute("aContactId");
		System.out.println(aContactId);

		if (aContactId == null) {
			try {
				if (c != null && userId != null) {
					c.setUserId(userId);
					contactService.save(c);
					return "redirect:clist?act=sv";
				}
			} catch (Exception e) {
				e.printStackTrace();
				m.addAttribute("err", "Failed to save contact");
				return "contact_form";
			}
		} else {
			try {
				if (aContactId != null) {
					c.setContactId(aContactId);
					contactService.update(c);
					session.removeAttribute("aContactId");
					return "redirect:clist?act=ed";
				}
			} catch (Exception e) {
				e.printStackTrace();
				m.addAttribute("err", "Failed to save contact");
				return "contact_form";
			}
		}
		return "redirect:clist";
	}

	@RequestMapping(value = { "/user/clist" })
	public String contactList(Model m, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");

		List<Contact> contactList = contactService.findUserContact(userId);
		m.addAttribute("contactList", contactList);
		return "clist";
	}

	@RequestMapping(value = { "/user/contact_search" })
	public String contactSearch(Model m, HttpSession session, @RequestParam("freeText") String freeText) {
		Integer userId = (Integer) session.getAttribute("userId");
		List<Contact> contactList = contactService.findUserContact(userId, freeText);
		
		if (contactList != null && contactList.size() > 0) {
			m.addAttribute("contactList", contactList);
		} else {
			m.addAttribute("err", "can't find contact list");
		}

		return "clist";
	}

	@RequestMapping(value = { "/user/del_contact" })
	public String deleteContact(@RequestParam("cid") Integer contactId) {
		contactService.delete(contactId);
		return "redirect:clist?act=del";
	}
	
	@RequestMapping(value = { "/user/bulk_cdelete" })
	public String deleteBulkContact(@RequestParam("cid") Integer[] contactIds) {
		System.out.println(contactIds.length);
		contactService.delete(contactIds);
		return "redirect:clist?act=del";
	}

}
