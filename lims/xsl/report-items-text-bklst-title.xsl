<?xml version = "1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the report-items into text.              -->
<!--                                                                   -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2003/04/20: Zarzar                                              -->
<!--     - initial version                                             -->
<!--     - edited report-items-text.xsl to fit booklist reports        -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:import href="report-items-text-bklst-callno.xsl"/>

   <!-- ============================================================ -->

   <xsl:template name = "body">
     <!-- Sort by title for the new book list report -->
     <xsl:apply-templates select = "bib/hol/item">
       <xsl:sort select = "../../z13-title"/>
     </xsl:apply-templates>
   </xsl:template>
</xsl:stylesheet>