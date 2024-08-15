<?xml version="1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the mismatched location report into      -->
<!-- text.                                                             -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/01/22: Hans                                                -->
<!--     - add item status display                                     -->
<!--                                                                   -->
<!--   2004/01/22: Ben                                                 -->
<!--     - add report title                                            -->
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
     <xsl:value-of select="title"/>
     <xsl:text>&#10;&#10;</xsl:text>
     <xsl:text>Bib       Item&#10;</xsl:text>
     <xsl:text>docnum    barcode        sublb coll  ip call number     title&#10;</xsl:text>
     <xsl:text>--------- -------------- ----- ----- -- --------------- --------------------&#10;</xsl:text>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="body">
     <!-- List of holdings in bib/hol order -->
     <xsl:apply-templates select="bib/hol/item">
     </xsl:apply-templates>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="summary">
     <xsl:text>&#10;Record Count&#10;</xsl:text>

     <xsl:text>  Bibs:  </xsl:text>
     <xsl:value-of select="count(/report/bib)"></xsl:value-of>
     <xsl:text>&#10;</xsl:text>
       
     <xsl:text>  Hols:  </xsl:text>
     <xsl:value-of select="count(/report/bib/hol)"></xsl:value-of>
     <xsl:text>&#10;</xsl:text>

     <xsl:text>  Items: </xsl:text>
     <xsl:value-of select="count(/report/bib/hol/item)"></xsl:value-of>
     <xsl:text>&#10;</xsl:text>

   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template match="item">
     <!-- Display bib information -->
     <xsl:apply-templates select="../.."/>
	  
     <!-- Display hol information -->
     <xsl:apply-templates select=".."/>

     <!-- Display item information -->
     <xsl:text> </xsl:text>
     <xsl:value-of select="substring(z30-barcode,1,14)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,z30-sub-library,5)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,z30-collection,5)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,z30-item-process-status,2)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,call-no,15)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,../../z13-title,30)"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template match="hol">
   </xsl:template>
   <xsl:template match="holxx">
	  
     <!-- Display hol information -->
     <xsl:text> </xsl:text>
     <xsl:value-of select="substring(docnum,7)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,sublibrary,5)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,collection,5)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,call-no,15)"/>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template match="bib">
     <xsl:value-of select="substring(docnum,7)"/>
   </xsl:template>


</xsl:stylesheet>


