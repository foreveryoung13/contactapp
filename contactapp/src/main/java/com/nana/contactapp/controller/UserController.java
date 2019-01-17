package com.nana.contactapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nana.contactapp.command.LoginCommand;
import com.nana.contactapp.command.UserCommand;
import com.nana.contactapp.domain.User;
import com.nana.contactapp.exception.UserBlockedException;
import com.nana.contactapp.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = { "/", "/index", "/user", "/admin" })
	public String index(Model m) {
		m.addAttribute("command", new LoginCommand());
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String handleLogin(@ModelAttribute("command") LoginCommand command, Model m, HttpSession session) {
		try {
			User loggedInUser = userService.login(command.getLoginName(), command.getPassword());

			if (loggedInUser == null) {
				m.addAttribute("err", "Login Failed Enter valid credentials.");
				return "index";

			} else {

				if (loggedInUser.getRole() != null) {
					if (loggedInUser.getRole().equals(UserService.ROLE_ADMIN)) {
						addUserInSession(loggedInUser, session); /* session logedin */
						return "redirect:admin/dashboard";
					} else if (loggedInUser.getRole().equals(UserService.ROLE_USER)) {
						addUserInSession(loggedInUser, session); /* session logedin */
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

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginfirst(HttpSession session) {
		session.invalidate();
		return "redirect:index?act=log";
	}

	@RequestMapping(value = { "/logout" })
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:index?act=lo";
	}

	@RequestMapping(value = { "/user/dashboard" })
	public String userDashboard(HttpSession session, Model m) {
		m.addAttribute("command", new LoginCommand());

		if (session.getAttribute("userId") != null) {
			return "dashboard_user";
		} else {
			return "redirect:/login";
		}

	}

	@RequestMapping(value = { "/admin/dashboard" })
	public String adminDashboard(HttpSession session, Model m) {
		m.addAttribute("command", new LoginCommand());

		if (session.getAttribute("userId") != null) {
			return "dashboard_admin";
		} else {
			return "redirect:/login";
		}

	}

	@RequestMapping(value = { "/reg_form" })
	public String registrationForm(Model m) {
		UserCommand cmd = new UserCommand();
		m.addAttribute("command", cmd);
		return "reg_form";
	}

	@RequestMapping(value = { "/register" })
	public String registerUser(@ModelAttribute("command") UserCommand cmd, Model m) {
		try {
			User user = cmd.getUser();
			user.setRole(UserService.ROLE_USER);
			user.setLoginStatus(userService.LOGIN_STATUS_ACTIVE);
			userService.register(user);
			return "redirect:index?act=reg";
		} catch (DuplicateKeyException e) {
			e.printStackTrace();
			m.addAttribute("err", "Username is already registered. please select another username");
			return "reg_form";
		}

	}

	private void addUserInSession(User u, HttpSession session) {
		session.setAttribute("user", u);
		session.setAttribute("userId", u.getUserId());
		session.setAttribute("role", u.getRole());
	}

	@RequestMapping(value = "/admin/users")
	public String getUserList(Model m) {
		m.addAttribute("userList", userService.getUserList());
		return "users"; // JSP
	}

}
