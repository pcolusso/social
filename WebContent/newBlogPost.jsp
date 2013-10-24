<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*"%>


<?xml-stylesheet href="form.xsl" type="text/xsl" ?>
<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />

<form>
	<title>New Blog Post</title>
	<field type="text" label="title"></field>
	<field type="text" label="date">24/10/2013</field>
	<field type="text" label="post"></field>
	<button label="Post">completeNewBlogPost.jsp</button>
</form>