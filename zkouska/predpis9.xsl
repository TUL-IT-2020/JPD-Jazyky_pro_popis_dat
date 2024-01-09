<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="publikace">
		<table>		
		<xsl:for-each select="polozka">
			<xsl:sort select="autor" />			
			<tr>			
				<td><xsl:value-of select="position()" /></td>				
				<td><xsl:value-of select="@id" /></td>
				<td><xsl:value-of select="autor" /></td>
				<td><xsl:value-of select="nazev" />
				<xsl:variable name="in" select="in" />
				<xsl:if test="@typ='clanek'"> (<xsl:value-of select="//polozka[@typ='sbornik' and @id=$in]/nazev" />)</xsl:if>
				</td>
			</tr>
		</xsl:for-each>
		</table>	
	</xsl:template>
</xsl:stylesheet>
