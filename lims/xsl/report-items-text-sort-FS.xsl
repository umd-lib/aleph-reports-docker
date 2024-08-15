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

   <xsl:import href="report-items-text.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name = "header">
     <!-- Header -->
     <xsl:text>&#10;</xsl:text>
     <xsl:value-of select = "title"/>
     <xsl:text>&#10;</xsl:text>
     <xsl:text>--------------------------------------</xsl:text>    
     <xsl:text>&#10;&#10;&#10;&#10;</xsl:text>
     <xsl:text>                                                    item                                                                &#10;</xsl:text>
     <xsl:text>title                                               coll   enumeration      barcode         call number      Copy Num.  &#10;</xsl:text>
     <xsl:text>--------------------------------------------------  -----  ---------------  --------------  --------------   --------   &#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template name = "body">
     <!-- List of items in bib/hol/item order -->
     <xsl:apply-templates select = "bib/hol/item">
       <xsl:sort select = "z30-collection"/>
       <xsl:sort select = "z30-call-no-key"/>
     </xsl:apply-templates>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match = "item">
     <!-- Display bib information -->
     <xsl:apply-templates select = "../.."/>
	  
     <!-- Display item information -->
     <xsl:value-of select = "java:pad( $x, z30-collection, 5 )"/>
     <xsl:text>  </xsl:text>

     <xsl:value-of select = "java:pad( $x, concat( z30-enumeration-a, ' ', z30-enumeration-b, ' ', z30-enumeration-c, ' ', z30-enumeration-d ), 15 )"/>
     <xsl:text>  </xsl:text>

     <xsl:value-of select = "substring( z30-barcode, 1, 14 )"/>
     <xsl:text>  </xsl:text>

     <xsl:value-of select = "substring(call-no, 1, 20)"/>
     <xsl:text>                    </xsl:text>
    
      <xsl:value-of select = "substring(z30-note-circulation, 1)"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match = "bib">
     <xsl:value-of select = "java:pad( $x, z13-title, 50 )"/>
     <xsl:text>  </xsl:text>
   </xsl:template>
</xsl:stylesheet>










