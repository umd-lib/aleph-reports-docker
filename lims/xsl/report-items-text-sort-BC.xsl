<?xml version = "1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the report-items into text.              -->
<!--                                                                   -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/03/18: Zarzar                                              -->
<!--     - initial version                                             -->
<!--     - edited report-items-text.xsl to fit BC Shelf List           -->
<!--       (Web Report #1368) requirements.                            -->
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
     <xsl:text>&#10;&#10;&#10;&#10;</xsl:text>
     <xsl:text>item                                                                    &#10;</xsl:text>
     <xsl:text>barcode          is   ips   circ. status   due date     call number     &#10;</xsl:text>
     <xsl:text>--------------   --   ---   ------------   ----------   ----------------&#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template name = "body">
     <!-- List of items in bib/hol/item order -->
     <xsl:apply-templates select = "bib/hol/item">
       <xsl:sort select = "z30-call-no-key"/>
       <xsl:sort select = "z36-status"/>
       <xsl:sort select = "z36-due-date"/>
     </xsl:apply-templates>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match = "item">
     <!-- Display bib information -->
     <xsl:apply-templates select = "../.."/>
	  
     <!-- Display item information -->
     <xsl:value-of select = "substring( z30-barcode, 1, 14 )"/>
     <xsl:text>   </xsl:text>

     <xsl:value-of select = "java:pad( $x, z30-item-status, 2 )"/>
     <xsl:text>   </xsl:text>

     <xsl:value-of select = "java:pad( $x, z30-item-process-status, 3 )"/>
     <xsl:text>   </xsl:text>

     <xsl:variable name = "circ-status">
       <xsl:choose>
         <xsl:when test = "z36-status = 'A'">
           <xsl:text>Checked Out</xsl:text>
         </xsl:when>
         <xsl:when test = "z36-status = 'C'">
           <xsl:text>Returned</xsl:text>
         </xsl:when>
         <xsl:when test = "z36-status = 'L'">
           <xsl:text>Lost</xsl:text>
         </xsl:when>
       </xsl:choose>
     </xsl:variable>

     <xsl:value-of select = "java:pad( $x, $circ-status, 12 )"/>
     <xsl:text>   </xsl:text>

     <xsl:if test = "z36-due-date">
       <xsl:value-of select = "concat( substring( z36-due-date, 5, 2 ), '/', substring( z36-due-date, 7, 2 ), '/', substring( z36-due-date, 1, 4 ))"/>
       <xsl:text>   </xsl:text>
     </xsl:if>

     <xsl:if test = "not( z36-due-date )">
       <xsl:text>             </xsl:text>
     </xsl:if>

     <xsl:value-of select = "call-no"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match = "bib">
   </xsl:template>
</xsl:stylesheet>
