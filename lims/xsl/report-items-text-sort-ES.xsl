<?xml version = "1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the report-items into text.              -->
<!--                                                                   -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/03/18: Zarzar                                              -->
<!--     - initial version                                             -->
<!--     - edited report-items-text.xsl to fit SU Shelf List           -->
<!--       (Web Report #1356) requirements.                            -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:java="http://xml.apache.org/xslt/java">


   <xsl:import href="report-items-text.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name = "header">

     <!-- Header -->
     <xsl:call-template name = "print-report-title"/>   

     <xsl:text>item                                    bib                                                item          &#10;</xsl:text>
     <xsl:text>sublib coll  call number                title                                              barcode       &#10;</xsl:text>
     <xsl:text>------ ----- -------------------------- -------------------------------------------------- --------------&#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template name = "body">
     <!-- List of holdings in bib/hol order -->
     <xsl:apply-templates select = "bib/hol/item">
       <xsl:sort select = "z30-call-no-key"/>
     </xsl:apply-templates>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match = "item">

     <!-- Display bib information -->
     <xsl:value-of select="java:pad( $x, z30-sub-library, 6)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad( $x, z30-collection, 5)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, call-no, 26)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, ../../z13-title, 50)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad( $x, z30-barcode, 14)"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>
</xsl:stylesheet>
