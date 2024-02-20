<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">

    <xsl:output method="xml" encoding="utf-8" indent="yes" />

    <xsl:template match="/">
        <xsl:element name="html">
            <xsl:element name="head">
            </xsl:element>
            <xsl:element name="body">
                <!-- Pro kazdou "mistnost" ze seznamu "mistnosti"-->
                <xsl:for-each select="//mistnosti/mistnost">
                    <xsl:element name="li">
                        <xsl:element name="strong">
                            <xsl:value-of select="nazev" />
                        </xsl:element>
                        <xsl:text>,
    budova </xsl:text>
                        <xsl:value-of select="budova" />
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="patro" />
                        <xsl:text>. patro </xsl:text>
                    </xsl:element>
                </xsl:for-each>
                <xsl:apply-templates select="root" />
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>