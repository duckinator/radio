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

	<xsl:if test="listeners">
		<p><xsl:value-of select="listeners" /> people listening
			<xsl:if test="listener_peak">
				(peak: <xsl:value-of select="listener_peak" />)
			</xsl:if>
		</p>
	</xsl:if>

	<p>Now playing:
		<xsl:if test="artist">
			<xsl:value-of select="artist" /> -
		</xsl:if>
		<xsl:value-of select="title" />
	</p>

	<table>
	<tbody>
		<xsl:if test="stream_start">
		<tr>
			<td>Stream started:</td>
			<td class="streamstats"><xsl:value-of select="stream_start" /></td>
		</tr>
		</xsl:if>
		<xsl:if test="bitrate">
			<tr>
				<td>Bitrate:</td>
				<td class="streamstats"><xsl:value-of select="bitrate" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="quality">
			<tr>
				<td>Quality:</td>
				<td class="streamstats"><xsl:value-of select="quality" /></td>
			</tr>
		</xsl:if>
	</tbody>
	</table>
</xsl:when>
<xsl:otherwise>
	<h3><xsl:value-of select="@mount" /> - Not Connected</h3>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
