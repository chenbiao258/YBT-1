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
		object[0] = xmlText;//Object�������洢�����Ĳ���
		try {
			call = (Call) service.createCall();
			call.setTargetEndpointAddress(endpoint);// Զ�̵���·��
//			call.setOperationName(method);// ���õķ�����
			call.setOperationName(new QName("http://cxftest.ui.business.service.sinosoft.com/", method));

			// ���ò�����:
			call.addParameter("arg0", // ������
					XMLType.XSD_STRING,// ��������:String
					ParameterMode.IN);// ����ģʽ��'IN' or 'OUT'

			// ���÷���ֵ���ͣ�
			call.setReturnType(XMLType.XSD_STRING);// ����ֵ���ͣ�String			
			result = (String) call.invoke(object);// Զ�̵���
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
