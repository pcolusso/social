<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*"%>

<%
	String filePath = application.getRealPath("users.xml");
%>
<jsp:useBean id="socialApp" class="socialapp.src.SocialApp" scope="application">
    <jsp:setProperty name="socialApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

Users users = socialApp.getUsers();
User user = users.logon(email, password);
if (user != null) { // the login was successful
	session.setAttribute("user", user);
%>
<p>Login successful. Click <a href="index.jsp">here</a> to return to the main page.</p>
<% } else { %>
<p>Password incorrect. Click <a href="login.jsp">here</a> to try again.</p>
<% } %>

</body>
</html>