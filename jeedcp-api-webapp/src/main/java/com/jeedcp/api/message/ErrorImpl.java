package com.jeedcp.api.message;


public class ErrorImpl implements Error {

	private String code;
	private String message;

	public ErrorImpl(String code, String message) {
		this.code = code;
		this.message = message;
	}

	@Override
	public String getCode() {
		return code;
	}

	@Override
	public String getMessage() {
		return message;
	}

}
