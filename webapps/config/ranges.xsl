<?xml version="1.0"?>

<!-- ================================================================= -->
<!-- Convert call number ranges into html for web display.             -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/03/29: Ben                                                 -->
<!--     - initial version                                             -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0" 
>

   <xsl:output method="html" encoding="utf8"/>


   <!-- ============================================================ -->
   <!-- Top Level -->
   <xsl:template match="/callnums">

     <html>
       <body>
         <table style="font-family=Arial; font-size=10pt">
           <!-- Header -->
           <xsl:call-template name="header"/>

           <!-- Body -->
           <xsl:call-template name="body"/>
         </table>

       </body>
     </html>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="header">
     <!-- Header -->
     <tr>
       <td valign="top"><b>Start of Range</b><br/><hr/></td>
       <td valign="top"><b>Label</b><br/><hr/></td>
     </tr>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="body">

     <xsl:apply-templates select="range">
     </xsl:apply-templates>

   </xsl:template>



   <!-- ============================================================ -->

   <xsl:template match="range">
     <tr>
       <td valign="top"><xsl:value-of select="@start"/></td>
       <td valign="top"><xsl:value-of select="@label"/></td>
     </tr>

   </xsl:template>


</xsl:stylesheet>


