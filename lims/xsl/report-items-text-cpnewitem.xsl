<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:java="http://xml.apache.org/xslt/java">

   <!-- Differences from report-items-text.xsl:
          - display: z13-author, z13-imprint, z13-year, z13-isbn-issn
           
      2004/05/31: Zarzar
        - impetus: new material for CP sublibraries
   -->

   <xsl:import href="report-items-text.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name = "header">

     <xsl:call-template name = "print-report-title"/>

     <!-- Header -->
     <xsl:text>title                                    author          imprint         year isbn                 sublib coll  call number &#10;</xsl:text>
     <xsl:text>---------------------------------------- --------------- --------------- ---- -------------------- ------ ----- ----------- &#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

    <xsl:template name = "body">
     <xsl:apply-templates select = "bib/hol/item">
       <xsl:sort select = "z30-sub-library"/>
       <xsl:sort select = "z30-collection"/>
       <xsl:sort select = "z30-call-no-key"/>
     </xsl:apply-templates>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match="item">

     <!-- Display bib information -->
     <xsl:apply-templates select="../.."/>

     <!-- Display item information -->
     <xsl:value-of select = "java:pad( $x, z30-sub-library, 7 )"/>
     <xsl:value-of select = "java:pad( $x, z30-collection, 6 )"/>
     <xsl:value-of select = "call-no"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match="bib">

     <!-- Display item information -->
     <xsl:value-of select = "java:pad( $x, z13-title, 40 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, z13-author, 15 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, z13-imprint, 15 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, z13-year, 4 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select = "java:pad( $x, z13-isbn-issn, 20 )"/>
     <xsl:text> </xsl:text>
   </xsl:template>

</xsl:stylesheet>
