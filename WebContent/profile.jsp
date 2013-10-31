<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*;import java.util.List"%><?xml version="1.0" encoding="UTF-8"?>


<?xml-stylesheet href="profile.xsl" type="text/xsl" ?>
<jsp:useBean id="user" class="socialapp.src.User" scope="session" />
<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />

<% if (user.getName() == null) { %>
<error>
	<message>You are not logged in</message>
</error>
<% } else { %>

<profile>
	<user>
		<name><jsp:getProperty name="user" property="name" /></name>
		<email><jsp:getProperty name="user" property="email" /></email>
		<desc><jsp:getProperty name="user" property="description" /></desc>
	</user>
	<friends>
		<% for (Friend friend : user.getFriends()) { %>
			<friend name="<%=app.getUsers().getUser(friend.getUserId()).getName()%>" id="<%=friend.getUserId()%>">
				<%
					int userId = user.getId();
					int fId = friend.getUserId();
				
					if (app.isFriends(userId, fId))
					{
						%><accepted></accepted><%
					} else if (app.isAcceptable(userId, fId)) {
						%><accept></accept><%
					} else if (app.isPending(userId, fId)){
						%><pending></pending><%	
					}
				%>
			</friend>
		<% } %>
	</friends>
	<blog>
		<% for (Article article : user.getBlog()) { %>
			<article title="<%=article.getTitle()%>" date="<%=article.getPublishedDate()%>">
				<%=article.getContent()%>
				<editArticle title="<%=article.getTitle()%>" />
				<viewArticle userId="<%=user.getId()%>" title="<%=article.getTitle()%>" />
				<delArticle title="<%=article.getTitle()%>" />
			</article>
		<% } %>
	</blog>
</profile>

<% } %>