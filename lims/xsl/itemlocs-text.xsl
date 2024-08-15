<?xml version="1.0"?>

<!-- ================================================================= -->
<!-- Change the valid itemlocs.xml listing into text.                  -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/02/05: Ben                                                 -->
<!--     - initial version                                             -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:java="http://xml.apache.org/xslt/java"
>

   <xsl:output method="text" encoding="utf8"/>

   <!-- Java extension utility -->
   <xsl:variable name="x" select="java:edu.umd.lims.util.Xalan.new()"/>


   <!-- ============================================================ -->
   <!-- Top Level -->
   <xsl:template match="/itemlocs">

     <!-- Header -->
     <xsl:call-template name="header"/>

     <xsl:call-template name="body"/>

   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="header">
     <!-- Header -->
     <xsl:text>&#10;</xsl:text>
     <xsl:text> Sublb  Coll   Matrl  Status&#10;</xsl:text>
     <xsl:text> -----  -----  -----  ------&#10;</xsl:text>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="body">
     <xsl:apply-templates select="loc"/>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template match="loc">
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,@sublibrary,5)"/>
     <xsl:text>  </xsl:text>
     <xsl:value-of select="java:pad($x,@collection,5)"/>
     <xsl:text>  </xsl:text>
     <xsl:value-of select="java:pad($x,@material,5)"/>
     <xsl:text>  </xsl:text>
     <xsl:value-of select="java:pad($x,@status,2)"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>

</xsl:stylesheet>


