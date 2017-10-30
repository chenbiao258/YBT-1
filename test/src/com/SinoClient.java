package com;





public interface SinoClient<R,T> extends SinoCommunicate {

	public R send(TransInfo<T> transInfo ) throws SinoSoftException;
	
	
}
