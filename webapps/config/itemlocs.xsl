<?xml version="1.0"?>

<!-- ================================================================= -->
<!-- Convert valid itemlocs into html for web display.                 -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/04/15: Ben                                                 -->
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
   <xsl:template match="/itemlocs">

     <html>
       <body>
         <h2>Valid sublibrary/collection/material/item status combinations</h2>
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
       <td valign="top"><b>Sublibrary</b><br/><hr/></td>
       <td valign="top"><b>Collection</b><br/><hr/></td>
       <td valign="top"><b>Material</b><br/><hr/></td>
       <td valign="top"><b>Item Status</b><br/><hr/></td>
     </tr>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="body">

     <xsl:apply-templates select="loc">
     </xsl:apply-templates>

   </xsl:template>



   <!-- ============================================================ -->

   <xsl:template match="loc">
     <tr>
       <td valign="top"><xsl:value-of select="@sublibrary"/></td>
       <td valign="top"><xsl:value-of select="@collection"/></td>
       <td valign="top"><xsl:value-of select="@material"/></td>
       <td valign="top"><xsl:value-of select="@status"/></td>
     </tr>

   </xsl:template>


</xsl:stylesheet>


