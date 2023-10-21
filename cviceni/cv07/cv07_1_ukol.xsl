<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="uzivatele">
<seznam>
<xsl:apply-templates/>  
</seznam>
</xsl:template>
<xsl:template match="osoba">
  <xsl:element name="jmeno">
    <xsl:attribute name="id">
      <xsl:value-of select="@id"/>
    </xsl:attribute>
<xsl:apply-templates select="jmeno"/>
</xsl:element>
</xsl:template>
</xsl:stylesheet>