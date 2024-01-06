<!-- 
   Do tabulky zaradte pouze prazske prodejce. 
   Seradte je abecedne podle nazvu.
   Pridejte do tabulky treti sloupec obsahujici modely vozu nabizenych danym prodejcem.
   Mel by obsahovat nazvy vsech prvku model, jejichz atribut vyrobce se shoduje s obsahem nektereho prvku znacka obsazeneho v danem prodejci. 
   Tabulka by tedy mela zacina takto:

    <tr>
      <td> Autosalon Mysak</td>
      <td> Praha, Siroka 37 </td>
      <td> Enyaq superb octavia fabia </td>
   </tr>
 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--  model v vozy obsahuje vyrobce=string -->
<xsl:key name="modelyPodleVyrobce" match="vozy/model" use="@vyrobce"/>

<xsl:template match="/">
    <html>
    <body>
        <table border="1">
            <tr>
                <th>Nazev Prodejce</th>
                <th>Adresa</th>
                <th>Modely Vozu</th>
            </tr>
            <!-- filter podle adresa/mesto -> jenom praha  -->
            <xsl:for-each select="prehled/prodejci/firma[adresa/mesto='Praha']">
            <!-- sort podle nazev -->
                <xsl:sort select="nazev"/>
                <tr>
                    <td><xsl:value-of select="nazev"/></td>
                    <td>
                        <xsl:value-of select="adresa/mesto"/>, <xsl:value-of select="adresa/ulice"/>
                    </td>
                    <td>
                        <xsl:for-each select="znacka">
                        <!--  zapisu do promenne current brand to co je v znacka (napr. skoda) -->
                            <xsl:variable name="currentBrand" select="."/>
                            <!-- vyfiltruju z modelu vozu jenom ty, kteri maji v vyrobce = current Brand (napr skoda) -->
                            <xsl:for-each select="key('modelyPodleVyrobce', $currentBrand)">
                                <xsl:value-of select="nazev"/> 
                                <xsl:text> </xsl:text>
                            </xsl:for-each>
                        </xsl:for-each>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </body>
    </html>
</xsl:template>

</xsl:stylesheet>
