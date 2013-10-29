<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="socialapp.src.*"%>

<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />
<jsp:useBean id="user" class="socialapp.src.User" scope="session" />

<%

	int id = Integer.parseInt(request.getParameter("id"));

	
	user.removeFriend(id);
	
	app.save();
	response.sendRedirect("/social/profile.jsp");
%>