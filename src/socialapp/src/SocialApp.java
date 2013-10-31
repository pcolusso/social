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
		this.filePath = filePath;
		
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
		JAXBContext jc = JAXBContext.newInstance(Users.class);
		Marshaller m = jc.createMarshaller();
		
		FileOutputStream fout = new FileOutputStream(filePath);
		m.marshal(users, fout);
		fout.close();
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
	
	public boolean isFriends(int u1, int u2) {
		User a = users.getUser(u1);
		User b = users.getUser(u2);
		
		if (a == null || b == null)
			return false;
		
		Friend aB = a.getFriend(b.getId());
		Friend bA = b.getFriend(a.getId());
		
		if (aB == null || bA == null)
			return false;
		
		if (!aB.isAccepted() || !bA.isAccepted())
			return false;
		return true;
	}
	
	public boolean isPending(int origin, int dest) {
		User user = users.getUser(origin);
		User friend = users.getUser(dest);
		
		if (user == null || friend == null)
			return false;
		
		Friend userRel = user.getFriend(friend.getId());
		Friend friendRel = friend.getFriend(user.getId());
		
		if (userRel.isAccepted() && !friendRel.isAccepted())
			return true;
		return false;
	}
	
	public boolean isAcceptable(int origin, int dest) {
		User user = users.getUser(origin);
		User friend = users.getUser(dest);
		
		if (user == null || friend == null)
			return false;
		
		Friend userRel = user.getFriend(friend.getId());
		Friend friendRel = friend.getFriend(user.getId());
		
		if (!userRel.isAccepted() && friendRel.isAccepted())
			return true;
		
		return false;
	}
}
