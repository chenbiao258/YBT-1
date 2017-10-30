package com;

/***
 * 
 * 消息传输载体。�?�接�?
 * @author CDK
 *
 * @param <R>  发�?�的 info 类型
 */
public interface TransInfo<R> {


	public int getPriority() ;

	public void setPriority(int priority);

	public String getUnitid();

	public void setUnitid(String unitid) ;
	
	public R getTransInfoObj() ;

	public void setTransInfoObj(R transInfoObj);

	public String getCharset();
	
	public void setCharset(String charset);
	
}
