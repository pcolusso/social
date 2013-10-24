<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="socialapp.src.*"%>

<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	User u = app.getUsers().logon(email, password);
	
	if (u != null) {
		session.setAttribute("user", u);
		response.sendRedirect("/social/profile.jsp");
	} else {
%>

<error>
	<message>Invalid Login! Email: <%=email %> Password: <%=password %></message>
</error>

<% } %>