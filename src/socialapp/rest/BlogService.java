package socialapp.rest;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;

import socialapp.src.Article;
import socialapp.src.SocialApp;
import socialapp.src.User;
import socialapp.src.Users;

@Path("/blog")
public class BlogService {
	@Context
	private ServletContext application;

	private SocialApp getSocialApp() throws JAXBException, IOException {
		synchronized (application) {
			SocialApp socialApp = (SocialApp) application.getAttribute("socialApp");
			if (socialApp == null) {
				socialApp = new SocialApp();
				socialApp.setFilePath(application.getRealPath("users.xml"));
				application.setAttribute("socialApp", socialApp);
			}
			return socialApp;
		}
	}

	@Path("hello")
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String hello() {
		return "Hi";
	}

	@SuppressWarnings({ "unused", "null" })
	@Path("getBlogs")
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public List<Article> getArticles(@QueryParam("startDate") String startDate,
			@QueryParam("endDate") String endDate) throws JAXBException,
			IOException, ParseException {
		Calendar start = createDate(startDate);
		Calendar end = createDate(endDate);
		SocialApp socialApp = getSocialApp();
		Users users = socialApp.getUsers();
		List<User> userList = users.getUsers();
		List<Article> articleList = null;
		List<Article> articles = null;
		
		for (User user : userList) {
			articles.addAll(user.getBlog());
			
			for (Article article : articles) {
				Calendar articleDate = createDate(article.getPublishedDate());
				if (startDate != null && endDate != null) {
					if (articleDate.after(start) && articleDate.before(end)) {
						articleList.add(article);
					}
				} else if (startDate != null) {
					if (articleDate.after(start)) {
						articleList.add(article);
					}
				} else if (endDate != null) {
					if (articleDate.before(end)) {
						articleList.add(article);
					}
				}
			}
		}

		if (articleList != null)
			return articleList;
		else
			return articles;
	}

	private Calendar createDate(String date) throws ParseException {
		if (date != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(formatter.parse(date));
			return calendar;
		} else
			return null;
	}
}