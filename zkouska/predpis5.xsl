<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="mistnosti">
    <ul>
      <xsl:for-each select="mistnost">
        <xsl:if test="patro=1">
          <li>
            <strong><xsl:value-of select="nazev" /></strong><br /> 
            budova <xsl:value-of select="budova" /> <xsl:text>, </xsl:text>
            <xsl:value-of select="patro" />. patro<br />
            <xsl:variable name="id" select="@id" />
            <xsl:for-each select="//osoba[kancelar=$id]">
                <xsl:value-of select="jmeno" /> <xsl:text> </xsl:text>
                <xsl:value-of select="prijmeni" />
                <xsl:if test="position()!=last()"> <xsl:text>, </xsl:text> </xsl:if>
            </xsl:for-each>
          </li>
        </xsl:if>
      </xsl:for-each>
    </ul>
  </xsl:template>
  
  <xsl:template match="zamestnanci">
  </xsl:template>
  
</xsl:stylesheet>

