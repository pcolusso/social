<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="error.xsl" />
	<xsl:template match="/profile">
		<html>
			<head>
				<title><xsl:value-of select="user/name" />'s Profile</title>
			</head>
			<body>
				<xsl:apply-templates select="user" />
				<xsl:apply-templates select="blog" />
				<xsl:apply-templates select="friends" />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="blog">
		<h1>Your Blog Articles</h1>
		<a href="newBlogPost.jsp">New Post...</a>
		<div><xsl:apply-templates select="article" /></div>
	</xsl:template>
	
	<xsl:template match="article">
		<h2><xsl:value-of select="@title" /></h2>
		<i>Published <xsl:value-of select="@date" /></i>
		<xsl:apply-templates select="editArticle" />
		<xsl:apply-templates select="viewArticle" />
		<xsl:apply-templates select="delArticle" />
	</xsl:template>
	 
	<xsl:template match="editArticle">
		<a>
			<xsl:attribute name="href">editPost.jsp?title=<xsl:value-of select="@title" /></xsl:attribute>
			Edit..
		</a>
	</xsl:template>
	
	<xsl:template match="viewArticle">
		<a>
			<xsl:attribute name="href">
				viewPost.jsp?title=<xsl:value-of select="@title" />&amp;userId=<xsl:value-of select="@userId" />
			</xsl:attribute>
			View..
		</a>
	</xsl:template>
	
	<xsl:template match="delArticle">
		<a>
			<xsl:attribute name="href">
				delPost.jsp?title=<xsl:value-of select="@title" />
			</xsl:attribute>
			Delete..
		</a>
	</xsl:template>
	
	<xsl:template match="user">
		<h1>Welcome, <xsl:value-of select="name" />!</h1>
		<u><xsl:value-of select="desc" /></u><br />
		<a href="editProfile.jsp">edit</a>|<a href="logout.jsp">logout</a>
	</xsl:template>
	
	<xsl:template match="friends">
		<h1>Your Friends</h1>
		<xsl:apply-templates select="friend" />
	</xsl:template>
	
	<xsl:template match="friend">
		<b><xsl:value-of select="@name" /></b>
	</xsl:template>
</xsl:stylesheet>