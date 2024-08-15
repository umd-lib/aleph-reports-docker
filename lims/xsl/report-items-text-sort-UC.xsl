<?xml version = "1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the report-items into text.              -->
<!--                                                                   -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/05/17: Zarzar                                              -->
<!--     - initial version                                             -->
<!--     - edited report-items-text.xsl to fit FSU REF shelf list      -->
<!--       (Web Report #1531) requirements.                            -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:java="http://xml.apache.org/xslt/java">

   <xsl:include href="report-items-text-funcs.xsl"/>
   <xsl:import href="report-items-text.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name = "header">

     <!-- Header -->
     <xsl:call-tempate name = "print-report-title"/>

     <xsl:text>bib                                                issn            item         enumeration                        &#10;</xsl:text>
     <xsl:text>docnum    title                                    isbn            sublib coll  chronology  matrl is call number   &#10;</xsl:text>
     <xsl:text>--------- ---------------------------------------- --------------- ------ ----- ----------- ----- -- -----------   &#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template name = "body">
     <!-- List of items in bib/hol/item order -->
     <xsl:apply-templates select = "bib/hol/item">
       <xsl:sort select = "../../z13-title"/>
       <xsl:sort select = "z30-sub-library"/>
     </xsl:apply-templates>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match = "item">
     <!-- Display bib information -->
     <xsl:apply-templates select = "../.."/>
	  
     <!-- Display item information -->
     <xsl:value-of select = "java:pad( $x, z30-sub-library, 6 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, z30-collection, 5 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, concat( z30-enumeration-a, ' ', z30-enumeration-b, ' ', z30-enumeration-c, ' ', z30-chronological-i, ' ', z30-chronological-i ), 11 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, z30-material, 5 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, z30-item-status, 2 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "call-no"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match = "bib">
     <xsl:value-of select="substring( docnum, 7 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, z13-title, 40 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, z13-isbn-issn, 15 )"/>
     <xsl:text> </xsl:text>
   </xsl:template>
</xsl:stylesheet>