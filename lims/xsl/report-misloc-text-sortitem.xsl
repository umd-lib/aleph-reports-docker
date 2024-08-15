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

   <xsl:import href="report-misloc-text.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name="body">

     <!-- List of items in hol sublibrary/collection/call# order -->
     <xsl:apply-templates select="bib/hol/item">
       <xsl:sort select="z30-sub-library"/>
       <xsl:sort select="z30-collection"/>
       <xsl:sort select="z30-call-no-key"/>
       <xsl:sort select="../sublibrary"/>
       <xsl:sort select="../collection"/>
       <xsl:sort select="../call-no-key"/>
     </xsl:apply-templates>

   </xsl:template>


</xsl:stylesheet>


