<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
<xsl:output method="html" encoding="utf-8" indent="yes"/>

<xsl:template name="choose_zam">
    <xsl:param name="kancl"></xsl:param>
    <xsl:for-each select="/data/zamestnanci/osoba">
        <xsl:choose>
            <xsl:when test="kancelar=$kancl">
                <xsl:value-of select="jmeno"/><xsl:text> </xsl:text><xsl:value-of select="prijmeni"/><xsl:text>, </xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:for-each>
</xsl:template>

<xsl:template match="/">
    <xsl:element name="html">
        <xsl:element name="head">
        </xsl:element>
        <xsl:element name="body">
            <xsl:element name="ul">
                <xsl:for-each select="/data/mistnosti/mistnost[patro = 1]">
                    <xsl:sort select="nazev" order="ascending" lang="cs"/>
                    <xsl:element name="li"><xsl:element name="strong"><xsl:value-of select="nazev"/></xsl:element>, 
Budova <xsl:value-of select="budova"/>, <xsl:value-of select="patro"/>. patro, 
<xsl:call-template name="choose_zam">
	  <xsl:with-param name="kancl"><xsl:value-of select="@id"/></xsl:with-param>
</xsl:call-template></xsl:element>
                </xsl:for-each>
           </xsl:element>
        </xsl:element>
    </xsl:element>
</xsl:template>

</xsl:stylesheet>