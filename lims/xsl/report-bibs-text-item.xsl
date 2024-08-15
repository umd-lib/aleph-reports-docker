<?xml version="1.0"?>

<!-- ================================================================= -->
<!-- Extract the bib doc numbers.                                      -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/04/20: Ben                                                 -->
<!--     - initial version                                             -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:java="http://xml.apache.org/xslt/java"
>

   <xsl:output method="text" encoding="utf8"/>

   <xsl:template match="/report">
     <xsl:apply-templates select="bib/hol/item"/>
   </xsl:template>

   <xsl:template match="item">
     <xsl:value-of select="z30-barcode"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>

</xsl:stylesheet>


