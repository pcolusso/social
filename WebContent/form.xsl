<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/form">
		<html>
			<body>
				<h1><xsl:value-of select="title" /></h1>
				<form method="POST">
					<xsl:attribute name="action">
						<xsl:value-of select="button" />
					</xsl:attribute>
					<xsl:apply-templates select="field" />
					<input type="submit">
						<xsl:attribute name="value">
							<xsl:value-of select="button/@label" />
						</xsl:attribute>
					</input>
				</form>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="field">
		<xsl:if test="not(contains(@type, 'hidden'))">
			<xsl:value-of select="@label" />
		</xsl:if>
		<xsl:choose>
			<xsl:when test="contains(@type, 'radio')">
				<input>
					<xsl:attribute name="type"><xsl:value-of select="@type" /></xsl:attribute>
					<xsl:attribute name="name"><xsl:value-of select="@name"></xsl:value-of></xsl:attribute>
					<xsl:attribute name="value"><xsl:value-of select="@value" /></xsl:attribute>
				</input> 
				<xsl:value-of select="." />
			</xsl:when>
			<xsl:otherwise>
				<input>
					<xsl:attribute name="type"><xsl:value-of select="@type" /></xsl:attribute>
					<xsl:attribute name="name"><xsl:value-of select="@name"></xsl:value-of></xsl:attribute>
					<xsl:attribute name="value"><xsl:value-of select="." /></xsl:attribute>
				</input> 
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:if test="contains(@type, 'radio')">
			
		</xsl:if>
		<br />
	</xsl:template>
	

</xsl:stylesheet>