<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*;import java.util.List"%><?xml version="1.0" encoding="UTF-8"?>

<?xml-stylesheet href="viewProfile.xsl" type="text/xsl" ?>

<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />

<%
	int userId = Integer.parseInt(request.getParameter("id"));
	User user = app.getUsers().getUser(userId);
%>

<% if (user == null) { %>
<error>
	<message>Not a valid user ID</message>
</error>
<% } else { %>

<profile>
	<user>
		<name><%=user.getName()%></name>
		<email><%=user.getEmail()%></email>
		<desc><%=user.getDescription()%></desc>
	</user>
	<friends>
		<% for (Friend friend : user.getFriends()) { %>
			<% if (friend.isAccepted()) { %>
			<friend name="<%=app.getUsers().getUser(friend.getUserId()).getName()%>">
				<accepted><%=friend.isAccepted()%></accepted>
			</friend>
			<% } %>
		<% } %>
	</friends>
	<blog>
		<% for (Article article : user.getBlog()) { %>
			<article title="<%=article.getTitle()%>" date="<%=article.getPublishedDate()%>">
				<%=article.getContent()%>
			</article>
		<% } %>
	</blog>
</profile>

<% } %>
