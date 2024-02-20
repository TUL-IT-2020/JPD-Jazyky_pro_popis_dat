<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="obrazek">
    <table>
      <xsl:for-each select="bod">
        <xsl:sort select="x" data-type="number" />
        <xsl:sort select="y" data-type="number" />
        <xsl:if test="x>=0 and y>=0">
          <tr>
            <td><xsl:value-of select="@id" /></td>
            <td><xsl:value-of select="x" /></td>
            <td><xsl:value-of select="y" /></td>
            <xsl:variable select="@id" name="B" />
            <td>
              <xsl:for-each select="//usecka[bod=$B]/bod[.!=$B]">
                 <xsl:value-of select="." /> <xsl:text> </xsl:text>
              </xsl:for-each>
            </td>
          </tr>  
        </xsl:if>
      </xsl:for-each>
    </table>
  </xsl:template>
  
</xsl:stylesheet>

