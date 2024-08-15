<?xml version="1.0"?>

<!-- ================================================================= -->
<!-- Extract the barcode numbers.                                      -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/11/19: bw                                                  -->
<!--     -modified to extract bib docnum only                          -->
<!--   2004/07/28: yk                                                  -->
<!--     -modified to extract barcode numbers only                     -->
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
     <xsl:apply-templates select="bib"/>
   </xsl:template>

   <xsl:template match="bib">
     <xsl:value-of select="substring(docnum,7)"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>

</xsl:stylesheet>


