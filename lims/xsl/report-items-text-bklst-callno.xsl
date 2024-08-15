<?xml version = "1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the report-items into text.              -->
<!--                                                                   -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/04/20: Zarzar                                              -->
<!--     - initial version                                             -->
<!--     - edited report-items-text.xsl new book list report           -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:java="http://xml.apache.org/xslt/java">

<!--
   <xsl:include href="report-items-text-funcs.xsl"/>
-->
   <xsl:import href="report-items-text.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name = "header">

     <!-- Header -->
<!--
     <xsl:call-tempate name = "print-report-title"/>
-->
     <xsl:text>&#10;</xsl:text>
     <xsl:value-of select="title"/>
     <xsl:text>&#10;&#10;</xsl:text>

     <xsl:text>sublib coll  author          title                                    format open date       call number  &#10;</xsl:text>
     <xsl:text>------ ----- --------------- ---------------------------------------- ------ ---------- -----------  &#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template name = "body">

     <!-- Sort by call number for the new book list report -->
     <xsl:apply-templates select = "bib/hol/item">
       <xsl:sort select = "z30-call-no-key"/>
     </xsl:apply-templates>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match = "item">
	  
     <!-- Display item information -->
     <xsl:value-of select = "java:pad( $x, z30-sub-library, 6 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, z30-collection, 5 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, ../../z13-author, 15 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, ../../z13-title, 40 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, z30-material, 6 )"/>
     <xsl:text> </xsl:text>
     <xsl:if test = "z30-open-date">
       <xsl:value-of select = "concat( substring( z30-open-date, 5, 2 ), '/', substring( z30-open-date, 7, 2 ), '/', substring( z30-open-date, 1, 4 ))"/>
     </xsl:if>
     <xsl:if test = "not( z30-open-date )">
       <xsl:text>          </xsl:text>
     </xsl:if>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "call-no"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>
</xsl:stylesheet>