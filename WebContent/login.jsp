<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*"%>

<?xml-stylesheet href="form.xsl" type="text/xsl" ?>
<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />

<form>
	<title>
	</title>
	<field type="text" label="email" />
	<field type="password" label="password" />
</form>