package socialapp.src;

import java.util.Date;

import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
public class Article {
	@XmlElement(name = "title")
	private String title;
	@XmlElement(name = "date")
	private String publishedDate;
	@XmlElement(name = "content")
	private String content;
	
	public Article() {
		
	}
	
	public Article(String title, String date, String content)
	{
		this.title = title;
		this.publishedDate = date;
		this.content = content;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPublishedDate() {
		return publishedDate;
	}
	public void setPublishedDate(String publishedDate) {
		this.publishedDate = publishedDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
