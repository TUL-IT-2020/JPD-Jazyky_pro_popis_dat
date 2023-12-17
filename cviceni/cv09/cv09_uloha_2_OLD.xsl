<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="idNumeric" match="osoba" use="translate(@id, 'usr', '')" />
    <xsl:output method="text" omit-xml-declaration="yes" />
    <xsl:strip-space elements="uzivatele osoba" />

    <xsl:template match="/">
        <xsl:for-each select="//osoba[kategorie = 'sluzba']">
            <xsl:sort select="translate(@id, 'usr', '')" data-type="number" />
            <xsl:value-of select="@id" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="jmeno" />
            <xsl:text>
</xsl:text>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>