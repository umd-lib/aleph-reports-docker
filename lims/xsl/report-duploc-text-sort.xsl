<?xml version="1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the duplicate location report into       -->
<!-- text.                                                             -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2003/10/23: Ben                                                 -->
<!--     - initial version                                             -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

   <xsl:import href="report-duploc-text.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name="body">

     <!-- List of holdings in sublibrary/collection/call# order -->
     <xsl:apply-templates select="bib/hol">
       <xsl:sort select="sublibrary"/>
       <xsl:sort select="collection"/>
       <xsl:sort select="call-no-key"/>
     </xsl:apply-templates>

   </xsl:template>


</xsl:stylesheet>


