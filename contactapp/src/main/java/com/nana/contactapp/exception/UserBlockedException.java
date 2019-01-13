package com.nana.contactapp.exception;

public class UserBlockedException extends Exception {

	public UserBlockedException() {

	}

	public UserBlockedException(String erDesc) {
		super(erDesc);
	}
}
