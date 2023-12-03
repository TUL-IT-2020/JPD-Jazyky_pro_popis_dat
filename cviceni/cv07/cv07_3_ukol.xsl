<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- Template for the root element -->
  <xsl:template match="uzivatele">
    <html>
      <head>
        <title>Seznam uzivatelu</title>
      </head>
      <body>
        <h1>Seznam uzivatelu</h1>
        <dl>
          <xsl:apply-templates />
        </dl>
      </body>
    </html>
  </xsl:template>

  <!-- Template for the osoba element -->
  <xsl:template match="osoba">
    <dt>
      <strong>
        <xsl:value-of select="jmeno" />
      </strong>
    </dt>
    <dd>shell: <xsl:value-of
        select="shell" /><br /> web: <a href="/~{jmeno}">/~<xsl:value-of select="jmeno" /></a>
    </dd>
  </xsl:template>
  
</xsl:stylesheet>