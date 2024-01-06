<!--  
   datovy soubor auta.xml obsahuje informace o automobilech a jejich prodejcich.
   vytvorte html tabulku s informacemi o prodejcich (prvky firma v prvku prodejci), 
   kde kazdemu prodejci bude odpovidat jeden radek (tr).
   Prvni sloupec (td) bude obsahovat vzdy nazev prodejce,
    druhy jeho adresu - neprve mesto a za nim carkou oddelenou ulici. 
   Vystup by tedy mel vypada zhruba nasledovane:
   
   <table>
   <tr>
      <td> Autosalon Vlk</td>
      <td> Plzen, U pivovaru 19 </td>
   </tr>
   </table>
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="/">
    <html>
    <body>
        <table border="1">
            <tr>
                <th>Nazev Prodejce</th>
                <th>Adresa</th>
            </tr>
            <xsl:for-each select="prehled/prodejci/firma">
                <tr>
                    <td><xsl:value-of select="nazev"/></td>
                    <td>
                        <xsl:value-of select="adresa/mesto"/>, <xsl:value-of select="adresa/ulice"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </body>
    </html>
</xsl:template>

</xsl:stylesheet>

