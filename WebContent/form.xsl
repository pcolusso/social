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
		<input>
			<xsl:attribute name="type"><xsl:value-of select="@type" /></xsl:attribute>
			<xsl:attribute name="name"><xsl:value-of select="@label"></xsl:value-of></xsl:attribute>
			<xsl:attribute name="value"><xsl:value-of select="." /></xsl:attribute>
		</input>
		<br />
	</xsl:template>
	

</xsl:stylesheet>