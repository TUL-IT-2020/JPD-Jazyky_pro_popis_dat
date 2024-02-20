<?xml version="1.0" encoding="utf-8"?>
<!-- Created with Liquid Studio (https://www.liquid-technologies.com) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <html>
            <body>
                <xsl:for-each select="doprava/linka">
                    <xsl:sort select="cislo" />
                    <h2>Linka <xsl:value-of select="cislo" /></h2>
                    <p>Doba jízdy: <xsl:value-of  select="sum(zastavka/cas)" /> minut</p>
                    <ul>
                        <xsl:for-each select="zastavka">
                            <li>
                                <xsl:value-of select="jmeno" />
                                
                                <xsl:variable name="currentLinka" select="../cislo"/>
                                <xsl:variable name="otherLinky" select="//linka[zastavka/jmeno = current()/jmeno and cislo != $currentLinka]/cislo"/>
                                <xsl:if test="$otherLinky">
                                    <xsl:text>(</xsl:text>
                                    <xsl:value-of select="$otherLinky"/>
                                    <xsl:text>)</xsl:text>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
