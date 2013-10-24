<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*"%>


<?xml-stylesheet href="form.xsl" type="text/xsl" ?>
<jsp:useBean id="user" class="socialapp.src.User" scope="session" />

<form>
	<title>Edit Your Profile</title>
	<field type="text" label="email"><%=user.getEmail()%></field>
	<field type="text" label="password"><%=user.getPassword()%></field>
	<field type="text" label="description"><%=user.getDescription()%></field>
	<button label="save">saveProfile.jsp</button>
</form>