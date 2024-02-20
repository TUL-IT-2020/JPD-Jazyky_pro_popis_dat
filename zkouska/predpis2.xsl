<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="mesta" >
    <ul>
      <xsl:for-each select="mesto">
        <xsl:sort select="./obyvatel" data-type="number" order="ascending" />
        <xsl:if test="./obyvatel>20000">
          <li>
            <xsl:value-of select="nazev" />, <xsl:value-of select="obyvatel" />, id=<xsl:value-of select="@id" />
          </li>
        </xsl:if>
      </xsl:for-each>
    </ul>
    Celkem mest: <xsl:value-of select="count( /mesta/mesto[obyvatel>20000] )" />
  </xsl:template>
</xsl:stylesheet>

