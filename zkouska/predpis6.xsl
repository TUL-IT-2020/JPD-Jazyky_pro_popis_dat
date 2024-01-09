<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="sit">
    <xsl:for-each select="katedra">
      <h2><xsl:value-of select="@id" /></h2>
      <xsl:variable name="domena" select="domena" />
      <ul>
        <xsl:for-each select="host">
          <xsl:variable name="podsit" select="podsit" />
          <xsl:if test="@typ='pc'">
            <li><xsl:value-of select="jmeno" />.<xsl:value-of select="$domena" /> (<xsl:value-of select="@typ" />) <xsl:value-of select="//podsit[@id=$podsit]/ip" />.<xsl:value-of select="ip" /></li>
          </xsl:if>
        </xsl:for-each>
      </ul>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>

