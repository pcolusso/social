<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*"%>


<?xml-stylesheet href="form.xsl" type="text/xsl" ?>
<jsp:useBean id="user" class="socialapp.src.User" scope="session" />

<form>
	<title>Edit Your Profile</title>
	<field type="text" name="name" label="name"><%=user.getName()%></field>
	<field type="text" name="email" label="email"><%=user.getEmail()%></field>
	<field type="text" name="password" label="password"><%=user.getPassword()%></field>
	<field type="text" name="description" label="description"><%=user.getDescription()%></field>
	<button label="save">completeEditProfile.jsp</button>
</form>