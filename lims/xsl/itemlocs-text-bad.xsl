<?xml version="1.0"?>

<!-- ================================================================= -->
<!-- Change the valid itemlocs.xml listing into text.                  -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/02/06: Ben                                                 -->
<!--     - initial version                                             -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

   <xsl:import href="itemlocs-text.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name="body">
     <xsl:apply-templates select="loc[contains(@sublibrary,'   ') or
           contains(@collection,'   ') or contains(@material,'    ') or
           contains(@status,' ')]"/>
   </xsl:template>

</xsl:stylesheet>


