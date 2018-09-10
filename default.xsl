<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:h="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="h"
>

<xsl:variable name="content" select="/*"/>

<xsl:template mode="t" match=" @* | node() ">
  <xsl:copy><xsl:copy-of select="@*"/>
    <xsl:apply-templates mode="t"/>
  </xsl:copy>
</xsl:template>

<xsl:template mode="t" match="/h:html/h:head/h:title">
  <xsl:copy>
    <xsl:value-of select="$content/@title"/>
    <xsl:text> — </xsl:text>
    <xsl:copy-of select="node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template mode="t" match="h:main[@id='content']/h:div[1]">
  <xsl:copy-of select="$content"/>
</xsl:template>

<xsl:template match="/*">
  <xsl:apply-templates mode="t" select="document('default.xml')"/>
</xsl:template>

</xsl:transform>
