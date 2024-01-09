<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <xsl:call-template name="hlavni" />
  </xsl:template>
  
  <xsl:template name="hlavni">
    <xsl:for-each select="*">
      <xsl:sort select="nazev" />
      <xsl:if test="name(.)='adresar'">
        <li><xsl:value-of select="nazev" /></li>
        <ul><xsl:call-template name="hlavni" /></ul>
      </xsl:if>
      <xsl:if test="name(.)='soubor'">
        <li>
          <xsl:for-each select="ancestor-or-self::*">
            <xsl:value-of select="nazev" /> <xsl:if test="position()!=last()"> <xsl:text>/</xsl:text> </xsl:if>
          </xsl:for-each>

        <xsl:if test="velikost>0"> (<xsl:value-of select="velikost" />) </xsl:if>
        </li>
      </xsl:if>   
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>

