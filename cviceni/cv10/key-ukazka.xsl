
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:strip-space elements="*" />

    <xsl:key name="incidents"
        match="/root//CarXref/Incident" use="../@xrefId" />
    <xsl:key name="carSpecifics"
        match="/root/carSpecifics/CarMake/@xrefId" use="../../@vin" />

    <xsl:template match="/">
        <incidents>
            <xsl:apply-templates select="root/car/CarInfo/@vin" />
        </incidents>
    </xsl:template>

    <xsl:template match="@vin">
        <xsl:apply-templates select="key('carSpecifics',.)" />
    </xsl:template>

    <xsl:template match="@xrefId">
        <xsl:apply-templates select="key('incidents', .)" />
    </xsl:template>

    <xsl:template match="Incident">
        <incident>
            <xsl:value-of select="." />
        </incident>
    </xsl:template>

</xsl:stylesheet>