<?xml version = "1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the report-items into text.              -->
<!--                                                                   -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--  2004-08-05 Yalan                                                 -->
<!--     - replaced format with internal note for SU                   -->
<!--                                                                   -->
<!--  2004/04/20: Zarzar                                               -->
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

     <xsl:text>coll   author           title                                     i-note           date        call number  &#10;</xsl:text>
     <xsl:text>-----  ---------------  ----------------------------------------  ---------------  ----------  -----------  &#10;</xsl:text>
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
     <xsl:value-of select = "java:pad($x, z30-collection, 5)"/>
     <xsl:text>  </xsl:text>
     <xsl:value-of select = "java:pad($x, ../../z13-author, 15)"/>
     <xsl:text>  </xsl:text>
     <xsl:value-of select = "java:pad($x, ../../z13-title, 40)"/>
     <xsl:text>  </xsl:text>
     <xsl:value-of select = "java:pad($x, z30-note-internal, 15)"/>
     <xsl:text>  </xsl:text>
     <xsl:choose>
       <xsl:when test = "z30-open-date and not( z30-open-date = '0' )">
         <xsl:value-of select = "concat( substring( z30-open-date, 5, 2 ), '/', substring( z30-open-date, 7, 2 ), '/', substring( z30-open-date, 1, 4 ))"/>
         <xsl:text>  </xsl:text>
       </xsl:when>
       <xsl:otherwise>
         <xsl:text>            </xsl:text>
       </xsl:otherwise>
     </xsl:choose>
     <xsl:value-of select = "call-no"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>
</xsl:stylesheet>