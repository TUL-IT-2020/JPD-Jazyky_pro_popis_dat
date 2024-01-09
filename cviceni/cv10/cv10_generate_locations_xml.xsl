<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Nastavení výstupu pro zachování UTF-8 a odsazení -->
  <xsl:output method="xml" encoding="UTF-8" indent="yes" />
  <!-- Definice klíče pro hromadné vyhledání unikátních lokací podle normalizovaného textu názvu -->
  <xsl:key name="locationKey" match="location" use="normalize-space(.)" />

  <!-- Hlavní šablona pro transformaci -->
  <xsl:template match="/">
    <!-- Vytvoření nového kořenového elementu 'locations' -->
    <xsl:element name="locations">

      <!-- Pro každou unikátní lokaci podle klíče -->
      <xsl:for-each select="//location[generate-id() = generate-id(key('locationKey', normalize-space(.))[1])]">
        <!-- Vytvoření nového elementu 'location' pro každou lokaci -->
        <xsl:element name="location">
          <!-- Vytvoření elementu 'location_name' s normalizovaným textem názvu lokace -->
          <xsl:element name="location_name">
            <xsl:value-of select="normalize-space(.)" />
          </xsl:element>

          <!-- Pro každý výskyt lokace s daným názvem -->
          <xsl:for-each select="key('locationKey', normalize-space(.))">
            <!-- Vytvoření elementu 'location_use' pro každý výskyt -->
            <xsl:element name="location_use">

              <!-- Vytvoření elementu 'act_number' s hodnotou 'act_number' z předka 'act' -->
              <xsl:element name="act_number">
                <xsl:value-of select="ancestor::act/act_number" />
              </xsl:element>

              <!-- Vytvoření elementu 'scene_number' s hodnotou 'scene_number' z předka 'scene' -->
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