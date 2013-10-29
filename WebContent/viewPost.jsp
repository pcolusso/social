<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="socialapp.src.*"%>


<?xml-stylesheet href="viewProfile.xsl" type="text/xsl" ?>
<?xml-stylesheet href="error.xsl" type="text/xsl" ?>
<jsp:useBean id="app" class="socialapp.src.SocialApp" scope="session" />

<%
String title = request.getParameter("title");
int userId = Integer.parseInt(request.getParameter("userId"));
	
Article article = app.getArticle(userId, title);
	
%>
<articleView>
	<article title="<%=article.getTitle()%>" date="<%=article.getPublishedDate()%>">
	<%=article.getContent()%>
	</article>
</articleView>
