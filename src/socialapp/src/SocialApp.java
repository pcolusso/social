package socialapp.src;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.xml.bind.*;

public class SocialApp {
	private String filePath;
	private Users users;

	public String getFilePath() {
		return filePath;
	}
	
	public void setFilePath(String filePath) throws JAXBException, IOException {
		// Create the unmarshaller
		JAXBContext jc = JAXBContext.newInstance(Users.class);
		Unmarshaller u = jc.createUnmarshaller();
		 
		// Now unmarshal the object from the file
		FileInputStream fin = new FileInputStream(filePath);
		users = (Users)u.unmarshal(fin); // This loads the "shop" object
		fin.close();
	}
	
	public Users getUsers() {
		return users;
	}
	
	public void save() throws IOException, JAXBException
	{	 
		//TODO: Fix me!
		//JAXBContext jc = JAXBContext.newInstance(Users.class);
		//Marshaller m = jc.createMarshaller();
		
		//FileOutputStream fout = new FileOutputStream(filePath);
		//m.marshal(users, fout);
		//fout.close();
	}
	
	public Article getArticle(int userId, String title) {
		for (User u : users.getUsers()) {
			if (u.getId() == userId) {
				for (Article a : u.getBlog()) {
					if (a.getTitle().equals(title)) {
						return a;
					}
				}
			}
		}
		return null;
	}
}
