<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*"%>


<?xml-stylesheet href="form.xsl" type="text/xsl" ?>
<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />

<form>
	<title>Login</title>
	<field type="text" name="email" label="email">paul@test.com</field>
	<field type="password" name="password" label="password">pass</field>
	<button label="login">completeLogin.jsp</button>
</form>