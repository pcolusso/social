package socialapp.soap;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBException;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

import socialapp.src.*;

@WebService(
	name="Blog",
	portName="BlogPort",
	serviceName="BlogService"
	)
public class Blog {

	@Resource
	private WebServiceContext context;

	private SocialApp getSocialApp() throws JAXBException, IOException {
		ServletContext application = (ServletContext) context
				.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		synchronized (application) {
			SocialApp socialApp = (SocialApp) application
					.getAttribute("socialApp");
			if (socialApp == null) {
				socialApp = new SocialApp();
				socialApp.setFilePath(application.getRealPath("users.xml"));
				application.setAttribute("socialApp", socialApp);
			}
			return socialApp;
		}
	}
	
	@WebMethod
	public String hello() {
		return "hello world";
	}
	
	@WebMethod
	public String getPassword(String email) throws JAXBException, IOException {
		SocialApp app = getSocialApp();
		Users users = app.getUsers();
		User user = users.getUser(email);
		return user.getPassword();
	}

	@WebMethod
	public User getUser(String email) throws JAXBException, IOException {
		SocialApp app = getSocialApp();
		Users users = app.getUsers();
		return users.getUser(email);
	}

	@WebMethod
	public User login(String email, String password) throws JAXBException,
			IOException {
		SocialApp app = getSocialApp();
		Users users = app.getUsers();
		return users.logon(email, password);
	}

	@WebMethod
	public List<Article> getBlogs(User user) {
		return user.getBlog();
	}

	@WebMethod
	public void deleteArticle(User user, String title) {
		SocialApp app = null;
		try {
			app = getSocialApp();
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for (Article article : user.getBlog()) {
			if (article.getTitle().equals(title))
				user.getBlog().remove(article);
		}

		try {
			app.save();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}