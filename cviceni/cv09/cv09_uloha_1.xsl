<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="xml" indent="yes" />
    <xsl:strip-space elements="*" />

    <xsl:template match="@*|node()">
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </xsl:template>
    
      <xsl:template match="uzivatele">
        <xsl:copy>
          <xsl:apply-templates select="osoba">
            <xsl:sort select="jmeno"/>
          </xsl:apply-templates>
        </xsl:copy>
      </xsl:template>

</xsl:stylesheet>