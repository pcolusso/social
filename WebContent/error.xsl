<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/error">
		<html>
			<h1>Error!</h1>
			<p><xsl:value-of select="message" /></p>
		</html>
	</xsl:template>

</xsl:stylesheet>