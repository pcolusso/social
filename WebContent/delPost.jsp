<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*"%>


<?xml-stylesheet href="form.xsl" type="text/xsl" ?>
<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />
<jsp:useBean id="user" class="socialapp.src.User" scope="session" />

<% 
	String title = request.getParameter("title");
	Article article = user.getArticle(title);
%>

<form>
	<title>Delete Post?</title>
	<field type="hidden" label="post"><%=article.getTitle() %></field>
	<button label="Delete">completeDelPost.jsp</button>
</form>