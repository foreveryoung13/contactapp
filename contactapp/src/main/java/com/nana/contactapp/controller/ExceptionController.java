package com.nana.contactapp.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ExceptionController {

	/*
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView exceptionHandling() {
		ModelAndView mview = new ModelAndView("exception_page");
		return mview;
	}*/

	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle(NoHandlerFoundException ex) {
		return "exception_page";
	}

}
