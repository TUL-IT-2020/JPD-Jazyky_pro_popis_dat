<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="uzivatele">
    <html>
    <head><title>Seznam uzivatelu</title></head>
    <body>
    <h1>Seznam uzivatelu</h1>
    <dl>
      <xsl:apply-templates/>
    </dl>
    </body>
    </html>
  </xsl:template>
  <xsl:template match="osoba">
    <dt><strong><xsl:value-of select="jmeno"/></strong></dt>
    
    <dd><xsl:value-of select="shell"/></dd>
  </xsl:template>
</xsl:stylesheet>
