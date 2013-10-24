<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="socialapp.src.*"%>

<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />

<%

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String desc = request.getParameter("description");
	
	User user = app.getUsers().getUser(email);
	
	user.setName(name);
	user.setEmail(email);
	user.setPassword(password);
	user.setDescription(desc);
	
	session.setAttribute("user", user);
	app.save();
	response.sendRedirect("/social/profile.jsp");
%>