<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <table>
      <xsl:for-each select="//grprvek">
        <xsl:sort select="pozice/x" data-type="number" />
        <xsl:sort select="pozice/y" data-type="number" />
        <tr>
          <td><xsl:value-of select="@id" /></td>
          <td><xsl:value-of select="@typ" /></td>
          <td><xsl:value-of select="pozice/x" /></td>
          <td><xsl:value-of select="pozice/y" /></td>
          <xsl:variable name="akt" select="@id" />
          <xsl:if test="name(..)='skupina' and count(../grprvek[@id!=$akt])>0">
            <td>
              <xsl:value-of select="parent::node()/@id" />
              <xsl:text> (</xsl:text>
              <xsl:for-each select="../grprvek[@id!=$akt]">
                <xsl:value-of select="@id" />
                <xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
              </xsl:for-each>
              <xsl:text>)</xsl:text>
            </td>
          </xsl:if>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
</xsl:stylesheet>

