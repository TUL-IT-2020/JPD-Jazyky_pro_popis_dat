<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
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
						<xsl:for-each select="catalog/cd">
							<xsl:sort select="title" />
			<tr>
								<td>
									<xsl:value-of select="title" />
								</td>
								<td>
									<xsl:value-of select="artist" />
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>