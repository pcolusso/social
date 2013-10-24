package socialapp.src;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;

@XmlAccessorType(XmlAccessType.FIELD)
public class User {
	@XmlAttribute(name = "id")
	private int id;
	@XmlElement(name = "name")
	private String name;
	@XmlElement(name = "email")
	private String email;
	@XmlElement(name = "description")
	private String description;
	@XmlElement(name="password")
	private String password;
	@XmlElementWrapper(name = "articles")
	@XmlElement(name = "article")
	private List<Article> blog;
	@XmlElementWrapper(name = "friends")
	@XmlElement(name = "friend")
	private List<Friend> friends;
	
	public User() {
		
	}
	
	public User(int id, String name, String email, String description, String password)
	{
		this.id = id;
		this.name = name;
		this.email = email;
		this.description = description;
		this.password = password;
		
		this.blog = new ArrayList<Article>();
		this.friends = new ArrayList<Friend>();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<Article> getBlog() {
		return blog;
	}
	
	public Article getArticle(String title) {
		for (Article a : blog)
			if (a.getTitle().equalsIgnoreCase(title))
				return a;
		return null;
	}
	
	public void setBlog(List<Article> blog) {
		this.blog = blog;
	}
	public List<Friend> getFriends() {
		return friends;
	}
	public void setFriends(List<Friend> friends) {
		this.friends = friends;
	}
}
