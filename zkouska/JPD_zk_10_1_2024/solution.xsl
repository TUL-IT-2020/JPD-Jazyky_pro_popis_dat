<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0">
   <xsl:output method="html" encoding="utf-8" indent="yes" />

   <xsl:template match="doprava">
      <html>
         <head>

         </head>
         <body>
            <xsl:apply-templates />
         </body>
      </html>
   </xsl:template>

   <xsl:template match="linka">
      <h2>Linka <xsl:value-of select="cislo" /></h2>
      <ul>
         <xsl:apply-templates />
      </ul>
   </xsl:template>

   <xsl:template match="zastavka">
      <li>
         <xsl:value-of select="jmeno" />
      </li>
   </xsl:template>

   <xsl:template match="cislo|script|cas">
   </xsl:template>

</xsl:stylesheet>