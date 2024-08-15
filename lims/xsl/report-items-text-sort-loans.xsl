<?xml version = "1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the report-items into text.              -->
<!--                                                                   -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/08/02: Zarzar                                              -->
<!--     - initial version                                             -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:java="http://xml.apache.org/xslt/java">

   <xsl:import href="report-items-text.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name = "header">
     <!-- Header -->
     <xsl:text>&#10;</xsl:text>
     <xsl:value-of select = "title"/>
     <xsl:text>&#10;</xsl:text>
     <xsl:text>--------------------------------------</xsl:text>    
     <xsl:text>&#10;&#10;&#10;</xsl:text>
     <xsl:text>bib                                                                                item                           circ   call   &#10;</xsl:text>
     <xsl:text>docnum     title                                                                   barcode         sublib  coll   count  number &#10;</xsl:text>
     <xsl:text>---------  ----------------------------------------------------------------------  --------------  ------  -----  -----  ------ &#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template name = "body">
     <!-- List of items in bib/hol/item order -->
     <xsl:apply-templates select = "bib/hol/item">
       <xsl:sort select="../../z13-title"/>
       <xsl:sort select="z30-call-no-key"/>
     </xsl:apply-templates>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match = "item">
     <!-- Display bib information -->
     <xsl:apply-templates select = "../.."/>

     <!-- Display item information -->
     <xsl:value-of select = "substring(z30-barcode, 1, 14)"/>
     <xsl:text>  </xsl:text>
     <xsl:value-of select = "java:pad($x, z30-sub-library, 8)"/>
     <xsl:value-of select = "java:pad($x, z30-collection, 9)"/>
     <xsl:value-of select = "java:pad($x, z36-no-loan + z36h-no-loan, 5)"/>
     <xsl:value-of select = "call-no"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match = "bib">
     <xsl:value-of select="substring(docnum, 7)"/>
     <xsl:text>  </xsl:text>
     <xsl:value-of select = "java:pad($x, z13-title, 70)"/>
     <xsl:text>  </xsl:text>
   </xsl:template>
</xsl:stylesheet>
