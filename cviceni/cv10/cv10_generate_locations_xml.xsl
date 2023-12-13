<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml"  encoding="UTF-8" indent="yes"/>  
  <xsl:key name="locationKey" match="location" use="normalize-space(.)" />

  <xsl:template match="/">
    <xsl:element name="locations">
      
      <xsl:for-each select="//location[generate-id() = generate-id(key('locationKey', normalize-space(.))[1])]">
        <xsl:element name="location">
          <xsl:element name="location_name">
            <xsl:value-of select="normalize-space(.)" />
          </xsl:element>
          
          <xsl:for-each select="key('locationKey', normalize-space(.))">
            <xsl:element name="location_use">
              <xsl:element name="act_number">
                <xsl:value-of select="ancestor::act/act_number" />
              </xsl:element>
              <xsl:element name="act_number">
                <xsl:value-of select="ancestor::scene/scene_number" />
              </xsl:element>
            </xsl:element>
          </xsl:for-each>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>