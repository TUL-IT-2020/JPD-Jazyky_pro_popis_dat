<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:template match="catalog">
		<html>
			<head>
				<title>Katalog CD</title>
			</head>
			<body>
				<h2>Katalog CD</h2>
				<table>
					<tbody>
						<tr>
							<th>titul</th>
							<th>umělec</th>
						</tr>
						<xsl:apply-templates select="cd">
							<xsl:sort select="title" />
						</xsl:apply-templates>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="cd">
		<tr>
			<td><xsl:apply-templates select="title" /></td>
			<td><xsl:apply-templates select="artist" /></td>
		</tr>
	</xsl:template>

</xsl:stylesheet>