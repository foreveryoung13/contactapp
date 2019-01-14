package com.nana.contactapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nana.contactapp.domain.Contact;
import com.nana.contactapp.services.ContactService;

@Controller
public class ContactController {

	@Autowired
	private ContactService contactService;

	@RequestMapping(value = { "/user/contact_form" })
	public String contactForm(Model m) {
		Contact contact = new Contact();
		m.addAttribute("command", contact);
		return "contact_form";
	}

	@RequestMapping(value = { "/user/save_contact" })
	public String saveContact(@ModelAttribute("command") Contact c, Model m, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		try {
			if (c != null && userId != null) {
				c.setUserId(userId);
				contactService.save(c);
			} else {
				m.addAttribute("err", "Contact is Null");
			}
			return "redirect:clist?act=sv";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("err", "Failed to save contact");
			return "contact_form";
		}
	}

	@RequestMapping(value = { "/user/clist" })
	public String contactList(Model m) {
		return "clist";
	}

}
