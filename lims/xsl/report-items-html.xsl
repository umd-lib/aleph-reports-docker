<?xml version="1.0"?>

<!-- ================================================================= -->
<!-- Change the xml output of the report-items into html.              -->
<!--                                                                   -->
<!-- Revision History                                                  -->
<!--                                                                   -->
<!--   2004/01/05: Ben                                                 -->
<!--     - initial version                                             -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:java="http://xml.apache.org/xslt/java"
>

   <xsl:output method="html" encoding="utf8"/>


   <!-- Java extension utility -->
   <xsl:variable name="x" select="java:edu.umd.lims.util.Xalan.new()"/>


   <!-- ============================================================ -->
   <!-- Top Level -->
   <xsl:template match="/report">

     <html>
       <body>
         <table style="font-family=Arial; font-size=9pt">
           <!-- Header -->
           <xsl:call-template name="header"/>

           <!-- List of holdings -->
           <xsl:call-template name="body"/>
         </table>

         <!-- Summary -->
         <xsl:call-template name="summary"/>

       </body>
     </html>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="header">
     <!-- Header -->
       <tr>
         <td valign="top" colspan="2"><b>Bib</b></td>
         <td valign="top" colspan="4"><b>Item</b></td>
       </tr>

		 <tr>
         <td valign="top"><b>docnum</b></td>
         <td valign="top"><b>title</b></td>
         <td valign="top"><b>barcode</b></td>
         <td valign="top"><b>sublib</b></td>
         <td valign="top"><b>coll</b></td>
         <td valign="top"><b>call number</b></td>
       </tr>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="body">

     <!-- List of items in sublibrary/collection/call# order -->
     <xsl:apply-templates select="bib/hol/item">
       <xsl:sort select="z30-sub-library"/>
       <xsl:sort select="z30-collection"/>
       <xsl:sort select="z30-call-no-key"/>
     </xsl:apply-templates>

   </xsl:template>



   <!-- ============================================================ -->

   <xsl:template name="summary">
     <pre>
     <xsl:text>&#10;Record Count&#10;</xsl:text>

     <xsl:text>  Bibs:  </xsl:text>
     <xsl:value-of select="count(/report/bib)"></xsl:value-of>
     <xsl:text>&#10;</xsl:text>
       
     <xsl:text>  Hols:  </xsl:text>
     <xsl:value-of select="count(/report/bib/hol)"></xsl:value-of>
     <xsl:text>&#10;</xsl:text>

     <xsl:text>  Items: </xsl:text>
     <xsl:value-of select="count(/report/bib/hol/item)"></xsl:value-of>
     <xsl:text>&#10;</xsl:text>
     </pre>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template match="item">
     <tr>
       <!-- Display bib information -->
       <xsl:apply-templates select="../.."/>
	    
       <!-- Display item information -->
       <td valign="top"><xsl:value-of select="z30-barcode"/></td>
       <td valign="top"><xsl:value-of select="z30-sub-library"/></td>
       <td valign="top"><xsl:value-of select="z30-collection"/></td>
       <td valign="top" nowrap="true"><xsl:value-of select="z30-call-no"/></td>
     </tr>

   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template match="bib">
     <td valign="top"><xsl:value-of select="substring(docnum,7)"/></td>
     <td valign="top"><xsl:value-of select="z13-title"/></td>
   </xsl:template>


</xsl:stylesheet>


