<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/profile">
		<html>
			<head>
				<title><xsl:value-of select="user/name" />'s Profile</title>
			</head>
			<body>
				<xsl:apply-templates select="user" />
				<xsl:apply-templates select="blog" />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="/articleView">
		<html>
			<head>
				<title><xsl:value-of select="article/@title" /></title>
			</head>
			<body>
				<xsl:apply-templates select="article" />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="blog">
		<h1>Blog</h1>
		<div><xsl:apply-templates select="article" /></div>
	</xsl:template>
	
	<xsl:template match="article">
		<h2><xsl:value-of select="@title" /></h2>
		<i>Published <xsl:value-of select="@date" /></i>
		<p><xsl:value-of select="." /></p>
		<xsl:apply-templates select="articleLink" />
	</xsl:template>
	
	<xsl:template match="articleLink">
		<a>
			<xsl:attribute name="href">
				viewPost.jsp?title=<xsl:value-of select="@title" />&amp;userId=<xsl:value-of select="@userId" />
			</xsl:attribute>
			View..
		</a>
	</xsl:template>
	
	<xsl:template match="user">
		<h1><xsl:value-of select="name" />'s Profile</h1>
		<u><xsl:value-of select="desc" /></u>
	</xsl:template>
</xsl:stylesheet>