<?xml version="1.0"?>

<!-- ================================================================= -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/01/05: Ben                                                 -->
<!--     - initial version                                             -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

   <xsl:import href="report-items-text.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name="body">

     <!-- List of items in sublibrary/collection/call# order -->
     <xsl:apply-templates select="bib/hol/item">
       <xsl:sort select="z30-sub-library"/>
       <xsl:sort select="z30-collection"/>
       <xsl:sort select="z30-call-no-key"/>
     </xsl:apply-templates>

   </xsl:template>


</xsl:stylesheet>


