<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0">
<xsl:output omit-xml-declaration="no" method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>radio.do1g.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
<style>
* { background: #fafaff; }
main {
    font-family: helvetica, sans-serif;
    font-size: 1.5rem;
    max-width: 60ch;
    margin: 0 auto;
}
h2 { font-size: 2rem; }
ul, h2 {
    text-align: center;
}
ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
a, a:visited { color: #166491; }
a:active, a:focus, a:hover{ color: #2197db; }
</style>
</head>
<body>
<main>
	<h1 id="header">Icecast2 Status</h1>

<xsl:for-each select="source">
<xsl:choose>
<xsl:when test="listeners">
	<h3>
	<xsl:choose>
		<xsl:when test="server_name">
			<xsl:value-of select="server_name" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="@mount" />
		</xsl:otherwise>
	</xsl:choose>
	</h3>

	<xsl:if test="server_description">
		<h4><xsl:value-of select="server_description" /></h4>
	</xsl:if>

	<div class="right">
		<ul class="mountlist">
			<li><a class="play" href="{@mount}.m3u">M3U</a></li>
			<li><a class="play" href="{@mount}.xspf">XSPF</a></li>
		</ul>
	</div>

	<xsl:if test="server_type and ((server_type = 'application/ogg') or (server_type = 'audio/ogg'))">
		<audio controls="controls" preload="none">
			<source src="{@mount}" type="{server_type}" />
		</audio>
	</xsl:if>

	<iframe href="/now-playing.xsl"></iframe>

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
