<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*"%>


<?xml-stylesheet href="form.xsl" type="text/xsl" ?>
<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />
<jsp:useBean id="user" class="socialapp.src.User" scope="session" />

<% 
	String title = request.getParameter("title");
	Article article = user.getArticle(title);
	System.out.println(title); 
	
%>

<form>
	<title>Edit Blog Post</title>
	<field type="text" label="title"><%=article.getTitle() %></field>
	<field type="text" label="date"><%=article.getPublishedDate() %></field>
	<field type="text" label="post"><%=article.getContent() %></field>
	<button label="Post">completeNewBlogPost.jsp</button>
</form>