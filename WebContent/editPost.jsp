<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*"%>


<?xml-stylesheet href="form.xsl" type="text/xsl" ?>
<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />
<jsp:useBean id="user" class="socialapp.src.User" scope="session" />

<% 
        String title = request.getParameter("title");
        Article article = user.getArticle(title);
%>

<form>
        <title>Edit Blog Post</title>
        <field type="hidden" name="oldTitle"><%=article.getTitle() %></field>
        <field type="text" name="title" label="title"><%=article.getTitle() %></field>
        <field type="text" name="date" label="date"><%=article.getPublishedDate() %></field>
        <field type="textarea" name="post" label="post"><%=article.getContent() %></field>
        <button label="Post">completeEditPost.jsp</button>
</form>