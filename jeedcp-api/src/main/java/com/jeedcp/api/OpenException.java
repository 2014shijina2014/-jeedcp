package com.jeedcp.api;


public class OpenException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	private Error error;

	public OpenException(Error error) {
		this.error = error;
	}

	public String getCode() {
		return this.getCode();
	}

	@Override
	public String getMessage() {
		return this.error.getMessage();
	}

}
