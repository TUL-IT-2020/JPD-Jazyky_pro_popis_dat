<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="utf-8" indent="yes" />
    <xsl:strip-space elements="*" />

    <xsl:template match="obchody">
        <html lang="cs">
            <head>
                <title>Obchody</title>
            </head>
            <body>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>

    <xsl:template match='prodejny'>
        <ul>
            <xsl:apply-templates />
        </ul>
    </xsl:template>

    <xsl:template match='prodejna'>
        <li>
            <strong>
                <xsl:value-of select="nazev" />
            </strong>
            <xsl:text disable-output-escaping="yes"><![CDATA[<br/>]]></xsl:text>
            <xsl:text>&#xa;</xsl:text>
            <xsl:value-of select="adresa/ulice" />
            <xsl:text>, </xsl:text>
            <xsl:value-of select="adresa/mesto" />
        </li>
    </xsl:template>

    <xsl:template match="nazev|adresa/ulice|adresa/mesto|zbozi">
</xsl:template>
</xsl:stylesheet>