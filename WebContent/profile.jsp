<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*"%><?xml version="1.0" encoding="UTF-8"?>

<jsp:useBean id="user" class="socialapp.src.User" scope="session" />
<%@ taglib uri="oracle.jsp.parse.OpenJspRegisterLib" prefix="jml" %>

<profile>
	<user>
		<name><jsp:getProperty name="user" property="name" /></name>
		<email><jsp:getProperty name="user" property="email" /></email>
		<desc><jsp:getProperty name="user" property="description" /></desc>
	</user>
	<friends>
		
	</friends>
	<blog>
		<article title="" date="">
		</article>
	</blog>
</profile>