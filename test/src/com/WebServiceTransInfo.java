package com;


/***
 * 
 * 
 * @author CDK
 * 
 */

public class WebServiceTransInfo extends AbstractTransInfo<Object[]> {




	private Class<?> wsClientClass;

	private String methodName;

	/**
	 * webservice client
	 * @see WebserviceEnum
	 */
	private String ClientType;

	public String getClientType() {
		return ClientType;
	}

	public void setClientType(String clientType) {
		ClientType = clientType;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public Class<?> getWsClientClass() {
		return wsClientClass;
	}

	public void setWsClientClass(Class<?> wsClientClass) {
		this.wsClientClass = wsClientClass;
	}

}
