<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
<xsl:output method="html" encoding="utf-8" indent="yes"/>


<xsl:template match="/">
    <xsl:element name="html">
        <xsl:element name="head">
        </xsl:element>
        <xsl:element name="body">
            <xsl:element name="ul">
                <xsl:for-each select="/data/mistnosti/mistnost">
                    <xsl:element name="li"><xsl:element name="strong"><xsl:value-of select="nazev"/></xsl:element>, 
Budova <xsl:value-of select="budova"/>, <xsl:value-of select="patro"/>. patro</xsl:element>
                </xsl:for-each>
           </xsl:element>
        </xsl:element>
    </xsl:element>
</xsl:template>

</xsl:stylesheet>