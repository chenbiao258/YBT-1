package tool;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

public class XmlUtil {
	//��stringת����xml�ļ�
    public static String xmlChangeString(String filename){
        try {
            SAXReader saxReader = new SAXReader();//�½�һ��������
           Document tempDocument = saxReader.read(XmlUtil.class.getClassLoader().getResourceAsStream(filename));//����һ���ļ�
            return tempDocument.asXML();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return null;
    }
    //���ַ���string����ת����xml�ļ�
    public static void strChangeXML(String str) throws IOException {
           SAXReader saxReader = new SAXReader();
           Document document;
           try {
            document = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
            OutputFormat format = OutputFormat.createPrettyPrint();
            /** ��document�е�����д���ļ��� */
            XMLWriter writer = new XMLWriter(new FileWriter(new File("src/com/webdesk/swing/powertable/digester/cctv.xml")),format);
            writer.write(document);
            writer.close();
           } catch (DocumentException e) {
            e.printStackTrace();
           }

   }
    public static void main(String[] args) {
    	String xmlString=XmlUtil.xmlChangeString("D:/test/retrieveGoalSolutionDetail_sample_request.xml");
    	System.out.println(xmlString);
	}
}


