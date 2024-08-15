<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:java="http://xml.apache.org/xslt/java"
>

   <!-- ============================================================ -->
   <!-- print out item report title in xsl text format               --> 
   <!-- ============================================================ -->

   <xsl:template name = "print-report-title">
     <!-- Header -->
     <xsl:variable name = "start-pnt" select = "((105 - string-length(title)) div 2)"/>

     <xsl:value-of select = "java:pad($x, ' ', $start-pnt - 1)"/>
     <xsl:value-of select = "title"/>
     <xsl:text>&#10;</xsl:text>

     <xsl:value-of select = "java:pad($x, ' ', 34)"/>
     <xsl:text>-----------------------------------</xsl:text>
     <xsl:text>&#10;</xsl:text>

     <xsl:value-of select = "java:pad($x, ' ', 42)"/>
     <xsl:value-of select = "start"/>
     <xsl:text>&#10;</xsl:text>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>
</xsl:stylesheet>