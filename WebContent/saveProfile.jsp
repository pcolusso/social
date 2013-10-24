<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="socialapp.src.*"%>

<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />

<%

app.save();

%>