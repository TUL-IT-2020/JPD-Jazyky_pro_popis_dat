<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Nastavení výstupu na HTML s odsazením -->
    <xsl:output method="html" encoding="utf-8" indent="yes" />

    <!-- Hlavní šablona pro transformaci -->
    <xsl:template match="/">
        <!-- Vytvoření elementu 'html' jako kořenový element výstupu -->
        <xsl:element name="html">
            <!-- Vytvoření elementu 'head' (prázdný, protože v originále prázdný) -->
            <xsl:element name="head">
            </xsl:element>
            <!-- Vytvoření elementu 'body' -->
            <xsl:element name="body">
                <!-- Vytvoření elementu 'table' pro tabulku -->
                <xsl:element name="table">
                    <!-- Vytvoření prvního řádku tabulky s hlavičkami sloupců -->
                    <xsl:element name="tr">
                        <xsl:element name="td">#</xsl:element>
                        <xsl:element name="td">dějství</xsl:element>
                        <xsl:element name="td">scéna</xsl:element>
                        <xsl:element name="td">lokace</xsl:element>
                    </xsl:element>

                    <!-- Pro každou scénu ve všech dějstvích -->
                    <xsl:for-each select="//act/scene">
                        <!-- Vytvoření řádku tabulky pro každou scénu -->
                        <xsl:element name="tr">
                            <!-- Vytvoření sloupce s absolutním pořadovým číslem -->
                            <xsl:element name="td">
                                <!-- PRO ABSOLUTNÍ POČET - VYHODNOCENÍ -->
                                <xsl:variable name="actualId" select="generate-id()" />
                                <xsl:for-each select="//act/scene">
                                    <!-- Zobrazení pořadového čísla pouze pro první výskyt každé scény -->
                                    <xsl:if test="generate-id()=$actualId">
                                        <xsl:value-of select="position()" />. </xsl:if>
                                </xsl:for-each>
                            </xsl:element>

                            <!-- Vytvoření sloupce s číslem dějství -->
                            <xsl:element name="td">
                                <xsl:value-of select="substring(../act_number,5)" />
                            </xsl:element>
                            <!-- Vytvoření sloupce s číslem scény -->
                            <xsl:element name="td">
                                <xsl:value-of select="substring(./scene_number,7)" />
                            </xsl:element>
                            <!-- Vytvoření sloupce s normalizovaným textem lokace -->
                            <xsl:element name="td">
                                <xsl:value-of select="normalize-space(location)" />
                            </xsl:element>

                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>