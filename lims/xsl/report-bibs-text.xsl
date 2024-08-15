<?xml version="1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of report-bibs report into text.            -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/01/12: Ben                                                 -->
<!--     - change output encoding to utf8                              -->
<!--                                                                   -->
<!--   2003/11/10: Ben                                                 -->
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
   <xsl:template match="/report">

     <!-- Header -->
     <xsl:call-template name="header"/>

     <!-- List of holdings -->
     <xsl:call-template name="body"/>

     <!-- Summary -->
     <xsl:call-template name="summary"/>

   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="header">
     <!-- Header -->
     <xsl:text>&#10;</xsl:text>
     <xsl:text>Bib       &#10;</xsl:text>
     <xsl:text>docnum    title&#10;</xsl:text>
     <xsl:text>--------- -----------------------------------------------------------------&#10;</xsl:text>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="body">
     <!-- List of bibs in selection order -->
     <xsl:apply-templates select="bib">
     </xsl:apply-templates>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="summary">
     <xsl:text>&#10;Record Count&#10;</xsl:text>

     <xsl:text>  Bibs:  </xsl:text>
     <xsl:value-of select="count(/report/bib)"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template match="bib">
     <xsl:value-of select="substring(docnum,7)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,z13-title,65)"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>


</xsl:stylesheet>


