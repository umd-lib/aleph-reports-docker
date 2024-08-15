<?xml version="1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the duplicate location report into       -->
<!-- text.                                                             -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2003/10/23: Ben                                                 -->
<!--     - reformat code and output so this code can be reused for     -->
<!--       sorting (cf. report-duploc-text-sort.xsl)                   -->
<!--     - add sublibrary count                                        -->
<!--                                                                   -->
<!--   2003/10/20: Ben                                                 -->
<!--     - initial version                                             -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:java="http://xml.apache.org/xslt/java"
>

   <xsl:output method="text" encoding="iso-8859-1"/>

   <!-- Count sublibrary occurrences -->
   <xsl:key name="sublibrary" match="sublibrary" use="."/>

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
     <xsl:text>Bib                                      Hol&#10;</xsl:text>
     <xsl:text>docnum    title                          docnum    sublb coll  call number    &#10;</xsl:text>
     <xsl:text>--------- ------------------------------ --------- ----- ----- ---------------&#10;</xsl:text>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="body">
     <!-- List of holdings in bib/hol order -->
     <xsl:apply-templates select="bib/hol">
<!--
       <xsl:sort select="sublibrary"/>
       <xsl:sort select="collection"/>
       <xsl:sort select="call-no-key"/>
-->
     </xsl:apply-templates>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="summary">
     <xsl:text>&#10;Record Count&#10;</xsl:text>

     <xsl:text>  Bibs: </xsl:text>
     <xsl:value-of select="count(/report/bib)"></xsl:value-of>
     <xsl:text>&#10;</xsl:text>
       
     <xsl:text>  Hols: </xsl:text>
     <xsl:value-of select="count(/report/bib/hol)"></xsl:value-of>
     <xsl:text>&#10;</xsl:text>

     <xsl:text>&#10;Sublibrary Count&#10;</xsl:text>
     <xsl:for-each select="//sublibrary[generate-id(.) = generate-id(key('sublibrary',.)[1])]">
       <xsl:sort select="."/>

       <xsl:text>  </xsl:text>
       <xsl:value-of select="."/>
       <xsl:text>: </xsl:text>
       <xsl:value-of select="count(key('sublibrary',.))"/>
       <xsl:text>&#10;</xsl:text>
     </xsl:for-each>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template match="hol">
     <!-- Display bib information -->
     <xsl:apply-templates select=".."/>
	  
     <!-- Display hol information -->
     <xsl:text> </xsl:text>
     <xsl:value-of select="substring(docnum,7)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,sublibrary,5)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,collection,5)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,call-no,15)"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template match="bib">
     <xsl:value-of select="substring(docnum,7)"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad($x,z13-title,30)"/>
   </xsl:template>


</xsl:stylesheet>


