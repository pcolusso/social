<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/profile">
		<html>
			<head>
				<title><xsl:value-of select="user/name" />'s Profile</title>
			</head>
			<body>
				<xsl:apply-templates select="user" />
				<h1>Your Blog</h1>
				<xsl:apply-templates select="blog" />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="blog">
		<div><xsl:apply-templates select="article" /></div>
	</xsl:template>
	
	<xsl:template match="article">
		<h2><xsl:value-of select="@title" /></h2>
		<i>Published <xsl:value-of select="@date" /></i>
		<p><xsl:value-of select="." /></p>
	</xsl:template>
	
	<xsl:template match="user">
		<h1>Welcome, <xsl:value-of select="name" />!</h1>
		<u><xsl:value-of select="desc" /></u>
	</xsl:template>
	
	<xsl:template match="friends">
		<h1>Your Friends</h1>
		<xsl:apply-templates select="friend" />
	</xsl:template>
	
	<xsl:template match="friend">
		<b><xsl:value-of select="@name" /></b>
	</xsl:template>
</xsl:stylesheet>