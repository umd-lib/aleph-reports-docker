<?xml version="1.0"?>
<!--
  Extract hol docnums from update-items output which have no more linked 
  items.
-->

<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

   <xsl:output method="text" encoding="utf8"/>

   <xsl:template match="/">
     <xsl:apply-templates select="report/bib/hol[nolinkeditems]"/>
   </xsl:template>

   <xsl:template match="hol">
     <xsl:value-of select="substring(docnum,7)"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>

</xsl:stylesheet>


