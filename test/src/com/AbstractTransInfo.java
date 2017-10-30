package com;

public abstract class AbstractTransInfo<R>  implements TransInfo<R>{

	
private int priority;
	
	private String  unitid;
	
	private R transInfoObj;
	
	private String 	charset;

	public String getCharset() {
		return charset;
	}

	public void setCharset(String charset) {
		this.charset = charset;
	}
	
	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	

	public String getUnitid() {
		return unitid;
	}

	public void setUnitid(String unitid) {
		this.unitid = unitid;
	}

	public R getTransInfoObj() {
		return transInfoObj;
	}

	public void setTransInfoObj(R transInfoObj) {
		this.transInfoObj = transInfoObj;
	}


	
}
