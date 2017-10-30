package com;



public class SinoSoftException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SinoSoftException(Throwable cause) {
		super(cause);
	}

	public SinoSoftException(String message, Throwable cause) {
		super(message, cause);
	}

	public SinoSoftException(String message) {
		super(message);
	}

	public SinoSoftException() {
		super();
	}
}
