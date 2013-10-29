<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*;import java.util.*"%><?xml version="1.0" encoding="UTF-8"?>



<?xml-stylesheet href="form.xsl" type="text/xsl" ?>
<jsp:useBean id="user" class="socialapp.src.User" scope="session" />
<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />

<%

	String query = request.getParameter("search");
	List<User> results = new LinkedList<User>();
	
	for (User u : app.getUsers().getUsers())
	{
		if (!app.isFriends(u.getId(), user.getId()))
		{
			if (u.getName().toLowerCase().contains(query.toLowerCase()))
			{
				results.add(u);
			}
		}
	}
%>

<form>
	<title>Search Results</title>
	<%for (User u : results) {%>
		<field type="radio" name="friend" value="<%=u.getId()%>"><%=u.getName()%></field>
	<% } %>
	<button label="Add">completeAddFriend.jsp</button>
</form>