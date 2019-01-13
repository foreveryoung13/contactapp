package com.nana.contactapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nana.contactapp.command.LoginCommand;
import com.nana.contactapp.domain.User;
import com.nana.contactapp.exception.UserBlockedException;
import com.nana.contactapp.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = { "/", "/index" })
	public String index(Model m) {
		m.addAttribute("command", new LoginCommand());
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String handleLogin(@ModelAttribute("command") LoginCommand command, Model m) {
		try {
			User loggedInUser = userService.login(command.getLoginName(), command.getPassword());

			if (loggedInUser == null) {
				m.addAttribute("err", "Login Failed Enter valid credentials.");
				return "index";
			} else {
				if (loggedInUser.getRole() != null) {
					if (loggedInUser.getRole().equals(UserService.ROLE_ADMIN)) {
						return "redirect:admin/dashboard";
					} else if (loggedInUser.getRole().equals(UserService.ROLE_USER)) {
						return "redirect:user/dashboard";
					} else {
						m.addAttribute("err", "Invalid USER ROLE");
						return "index";
					}
				} else {
					m.addAttribute("err", "logedInUser is NULL");
					return "index";
				}

			}
		} catch (UserBlockedException e) {
			m.addAttribute("err", e.getMessage());
			return "index";
		}
	}

	@RequestMapping(value = { "/user/dashboard" })
	public String userDashboard() {
		return "dashboard_user";
	}

	@RequestMapping(value = { "/admin/dashboard" })
	public String adminDashboard() {
		return "dashboard_admin";
	}

}
