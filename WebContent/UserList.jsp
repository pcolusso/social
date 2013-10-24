<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of users</title>
</head>
<body>

	<%
		String filePath=application.getRealPath("WEB-INF/users.xml"); 
			
			socialapp.src.SocialApp app = new socialapp.src.SocialApp();
			app.setFilePath(filePath);
			
			System.out.println(app.getUsers());
	%>
	socialapp.src.SocialApp diaryApp = new socialapp.src.SocialApp();

</body>
</html>