<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="filmoteka">
    <table>
      <xsl:for-each select="film[herci/herec = 'Harrison Ford']">
        <xsl:sort select="nazev" />
        <tr>
          <td><xsl:value-of select="@id" /></td>
          <td><xsl:value-of select="nazev" /></td>
          <td><xsl:value-of select="rezie" /></td>
          <td><xsl:value-of select="count(herci/*)" /></td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
</xsl:stylesheet>

