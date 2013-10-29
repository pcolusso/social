<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*;import java.util.List"%><?xml version="1.0" encoding="UTF-8"?>


<?xml-stylesheet href="profile.xsl" type="text/xsl" ?>
<jsp:useBean id="user" class="socialapp.src.User" scope="session" />
<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />

<form>
	<title>Find Friends</title>
	<field type="text" label="search">Bob</field>
	<button label="Search">addFriendResults.jsp</button>
</form>