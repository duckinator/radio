<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0">
<xsl:output omit-xml-declaration="no" method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="refresh" content="5">
<style>
* { background: #fafaff; }
body {
    font-family: helvetica, sans-serif;
    font-size: 1.5rem;
}
</style>
</head>
<body>
	<p>Now playing:
		<xsl:if test="artist">
			<xsl:value-of select="artist" /> -
		</xsl:if>
		<xsl:value-of select="title" />
	</p>

	<xsl:if test="listeners">
		<p>Listening (now): <xsl:value-of select="listeners" /></p>
	</xsl:if>

	<xsl:if test="listener_peak">
		<p>Listening (peak): <xsl:value-of select="listener_peak" /></p>
	</xsl:if>

</xsl:when>
<xsl:otherwise>
	<h3><xsl:value-of select="@mount" /> - Not Connected</h3>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>

</main>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
