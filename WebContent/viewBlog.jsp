<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*;import java.util.List"%><?xml version="1.0" encoding="UTF-8"?>

<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />

<%
	String title = request.getParameter("title");
	int userId = Integer.parseInt(request.getParameter("id"));
	
	User user = app.getUsers().getUser(userId);
	Article article = user.getArticle(title);
%>

<% if (user == null) { %>
<error>
	<message>Not a valid user ID</message>
</error>
<% } else if (article == null) { %>
<error>
	<message>Not a valid blog article</message>
</error>
<% } else { %>
<article>
	<title><%=article.getTitle() %></title>
	<date><%=article.getPublishedDate() %></date>
	<content><%=article.getContent() %></content>
</article>
<% } %>