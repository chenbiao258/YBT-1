package test.com;

import java.rmi.RemoteException;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;

public class webServiceTest {
	public String invokeRemoteFuc(String method,String xmlText) {
//		String endpoint = "http://uat-wealth-fps-hbcn.hk.hsbc:30001/fps-ws-web/GoalSolutionWebServiceEndpoint";
		String endpoint = "http://192.168.8.101:8080/new_eservice_business/ybt/HelloWorld?wsdl";
		String result ="";
		Service service = new Service();
		Call call;
		Object[] object = new Object[1];
		object[0] = xmlText;//Object是用来存储方法的参数
		try {
			call = (Call) service.createCall();
			call.setTargetEndpointAddress(endpoint);// 远程调用路径
//			call.setOperationName(method);// 调用的方法名
			call.setOperationName(new QName("http://cxftest.ui.business.service.sinosoft.com/", method));

			// 设置参数名:
			call.addParameter("arg0", // 参数名
					XMLType.XSD_STRING,// 参数类型:String
					ParameterMode.IN);// 参数模式：'IN' or 'OUT'

			// 设置返回值类型：
			call.setReturnType(XMLType.XSD_STRING);// 返回值类型：String			
			result = (String) call.invoke(object);// 远程调用
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static void main(String[] args) {
		webServiceTest webServiceTest =new webServiceTest();		
//		String xmlString=XmlUtil.xmlChangeString("com/file/retrieveGoalSolutionDetail_sample_request.xml");
		String xmlString="qiubin";
		if(xmlString!=null){
			System.out.println(webServiceTest.invokeRemoteFuc("sayHi", xmlString));
		}
		
	}
}
