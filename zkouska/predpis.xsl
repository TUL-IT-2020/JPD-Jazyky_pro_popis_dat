<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="dokument">
    <ul>
      <xsl:for-each select="//pojem">
        <xsl:sort select="." />  
        <li>
          <xsl:value-of select="@rodic" /> <xsl:if test="@rodic">,</xsl:if> <xsl:value-of select="." />: <xsl:value-of select="preceding::nadpis[1]" />
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>

