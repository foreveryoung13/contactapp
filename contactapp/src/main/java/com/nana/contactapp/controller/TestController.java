package com.nana.contactapp.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	@RequestMapping("/test/hello")
	public String helloWorld() {
		return "hello"; /* /WEB-INF/view/hello.jsp */
	}

	@RequestMapping("/test/ajax_test")
	public String helloPage() {
		return "test";
	}

	@RequestMapping("/test/get_time")
	@ResponseBody
	public String getServerTime() {
		Date d = new Date();
		return d.toString();
	}

}
