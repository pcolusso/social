package socialapp.soap;

import java.io.IOException;
import java.util.List;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.xml.bind.JAXBException;
import javax.xml.ws.Endpoint;

import socialapp.src.*;

@WebService
public class Blog {
	private SocialApp app;
	
	public Blog() {
		
	}
	
	@WebMethod
	public User login(String email, String password)
	{
		return app.getUsers().logon(email, password);
	}
	
	@WebMethod
	public List<Article> getBlogs(User user)
	{
		return user.getBlog();	
	}
	
	@WebMethod void deleteBlog(User user, Article blog) throws IOException, JAXBException
	{
		
		app.save();
	}

}
