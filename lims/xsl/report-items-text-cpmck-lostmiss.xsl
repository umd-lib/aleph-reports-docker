<?xml version = "1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the report-items into text.              -->
<!--                                                                   -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/04/09: Zarzar                                              -->
<!--     - initial version                                             -->
<!--     - edited report-items-text.xsl to fit CPMCK lost/missing      -->
<!--       report (Web Report #1441) requirements.                     -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:java="http://xml.apache.org/xslt/java">

   <xsl:import href="report-items-text-sort.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name = "header">
     <!-- Header -->
     <xsl:text>&#10;</xsl:text>
     <xsl:value-of select = "title"/>
     <xsl:text>&#10;</xsl:text>
     <xsl:text>-----------------------------------</xsl:text>
     <xsl:text>&#10;&#10;&#10;</xsl:text>
     <xsl:text>bib                                                                                          item               &#10;</xsl:text>
     <xsl:text>author                 title                                      isbn                        ips    call number   &#10;</xsl:text>
     <xsl:text>--------------------   ----------------------------------------   -------------------------   --     ------------- &#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match = "item">
     <!-- Display bib information -->
     <xsl:apply-templates select = "../.."/>
	  
     <!-- Display item information -->
     <xsl:text>   </xsl:text>
     <xsl:choose>
       <xsl:when test = "not( z30-item-process-status )">
         <xsl:text>L </xsl:text>
       </xsl:when>
       <xsl:otherwise>
         <xsl:value-of select="z30-item-process-status"/>
       </xsl:otherwise>
     </xsl:choose>
     <xsl:text>     </xsl:text>
     <xsl:value-of select = "call-no"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match = "bib">
     <xsl:value-of select = "java:pad( $x, z13-author, 20 )"/>
     <xsl:text>   </xsl:text>
     <xsl:value-of select = "java:pad( $x, z13-title, 40 )"/>
     <xsl:text>   </xsl:text>
     <xsl:value-of select = "java:pad( $x, z13-isbn-issn, 25 )"/>
   </xsl:template>
</xsl:stylesheet>
