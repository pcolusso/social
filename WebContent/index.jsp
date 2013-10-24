<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*"%>

<%
        String filePath = application.getRealPath("WEB-INF/users.xml");
		SocialApp app = new SocialApp();
		app.setFilePath(filePath);
		
		session.setAttribute("app", app);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	User u = (User)session.getAttribute("user");
	if (u == null) {
		%> <p>Not logged in. <a href="login.jsp">login</a></p> <%
	}
	else {
		response.sendRedirect("profile.jsp");
	}
%>
</body>
</html>