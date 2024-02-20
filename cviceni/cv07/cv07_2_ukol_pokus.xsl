<!-- Příklad XSLT pro transformaci seznamu uzivatelu -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Kořenová šablona -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Seznam uzivatelu</title>
      </head>
      <body>
        <h1>Seznam uzivatelu</h1>
        <dl>
          <!-- Aplikace transformace pro každý prvek 'jmeno' -->
          <xsl:apply-templates select="seznam/jmeno"/>
        </dl>
      </body>
    </html>
  </xsl:template>

  <!-- Šablona pro prvek 'jmeno' -->
  <xsl:template match="jmeno">
    <dt>
      <strong>
        <!-- Získání hodnoty 'id' atributu -->
        <xsl:value-of select="@id"/>
      </strong>
    </dt>
    <dd>
      <!-- Získání obsahu 'jmeno' elementu -->
      <xsl:value-of select="."/>
    </dd>
  </xsl:template>

</xsl:stylesheet>