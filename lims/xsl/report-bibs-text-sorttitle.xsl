<?xml version="1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the mismatched location report into      -->
<!-- text.                                                             -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2003/11/03: Ben                                                 -->
<!--     - initial version                                             -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

   <xsl:import href="report-bibs-text.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name="body">

     <!-- List of bibs in title order -->
     <xsl:apply-templates select="bib">
       <xsl:sort select="z13-title"/>
     </xsl:apply-templates>

   </xsl:template>


</xsl:stylesheet>


