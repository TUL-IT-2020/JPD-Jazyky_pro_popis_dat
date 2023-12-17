<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" />

    <xsl:template match="/">
        <xsl:for-each select="//osoba[kategorie='sluzba']">
            <xsl:sort select="number(substring-after(@id, 'usr'))"  data-type="number" />
            <xsl:value-of select="concat(@id, ' ', jmeno)" />
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>