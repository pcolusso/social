package socialapp.src;

import java.util.*;
import java.io.*;
import javax.xml.bind.*;
 
public class TestJAXB implements Serializable {
 public static void main(String[] args) throws Exception {
	 SocialApp app = new SocialApp();
	 app.setFilePath("WebContent/WEB-INF/users.xml");
	 
	 //Users users = new Users();
  
	 //users.addTestUser("Paul");
  
	  // Boilerplate code to convert objects to XML...
	  JAXBContext jc = JAXBContext.newInstance(Users.class);
	  Marshaller m = jc.createMarshaller();
	  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
	  m.marshal(app.getUsers(), System.out);
	 }
}