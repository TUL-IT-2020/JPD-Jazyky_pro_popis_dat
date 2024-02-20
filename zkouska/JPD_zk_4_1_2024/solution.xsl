<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="utf-8" indent="yes" />
    <xsl:strip-space elements="*" />

    <xsl:template match="prehled">
        <html lang="cs">
            <head>
                <title>Obchody</title>
                <style>
        table, th, td {
            border: 1px solid black;
            border-radius: 10px;
        }
                </style>
            </head>
            <body>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>

    <xsl:template match='prodejci'>
        <table>
            <tr>
                <th>Nazev Prodejce</th>
                <th>Adresa</th>
            </tr>
            <xsl:apply-templates />
        </table>
    </xsl:template>

    <xsl:template match='firma'>
        <tr>
            <td>
                <xsl:value-of select="nazev" />
            </td>
            <td>
                <xsl:value-of select="adresa/mesto" />
                <xsl:text>, </xsl:text>
                <xsl:value-of select="adresa/ulice" />
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="vozy">
    </xsl:template>

</xsl:stylesheet>