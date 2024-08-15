<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

   <xsl:key name="inst"       match="loc" use="substring(@sublibrary,1,2)"/>
   <xsl:key name="sublibrary" match="loc" use="@sublibrary"/>
   <xsl:key name="status"     match="loc" use="concat(@sublibrary,'--',@status)"/>
   <xsl:key name="collection" match="loc" use="concat(@sublibrary,'--',@status,'--',@collection)"/>


   <!-- ============================================================ -->

   <xsl:template match="printout">
     <xsl:apply-templates select="report"/>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template match="report">

     <html>
       <head>
         <style type="text/css">
           body {
             font-family:Arial;
             font-size:9pt;
           }
           table {
             font-family:Arial;
             font-size:9pt;
           }
           td {
             padding-left: 3px;
             padding-right: 3px;
           }
           td#vbar {
             border-left :1px solid gray;
           }
           tr#summary {
             font-weight: bold;
           }
         </style>
       </head>

       <body>
         <center>
           <b>
             <font style="font-family=Arial; font-size=12pt">
<!--
               <xsl:value-of select="title"/>
-->
               <xsl:value-of select="'Sublibrary/Item Status/Collection/Material Combinations'"/>
             </font>
             <br/>
             <font>
               <xsl:value-of select="start"/>
             </font>
           </b>
         </center>

         <br/>
         Active Loan Date Range:
             <xsl:value-of select="substring(loan-start,1,4)"/>/<xsl:value-of select="substring(loan-start,5,2)"/>/<xsl:value-of select="substring(loan-start,7,2)"/>
             -
             <xsl:value-of select="substring(loan-stop,1,4)"/>/<xsl:value-of select="substring(loan-stop,5,2)"/>/<xsl:value-of select="substring(loan-stop,7,2)"/>

         <table cellspacing="0" border="0">
           <!-- Spacer -->
           <tr><td colspan="5"><br/><br/></td></tr>

           <!-- Body -->
           <xsl:call-template name="header"/>
           <xsl:call-template name="body"/>

         </table>
       </body>
     </html>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="header">
     <!-- Header -->
       <tr  style="font-family=Arial; font-size=12pt">
         <td valign="bottom"><strong>Sublib</strong></td>
         <td valign="bottom"><strong>IS</strong></td>
         <td valign="bottom"><strong>Coll</strong></td>
         <td valign="bottom"><strong>Matrl</strong></td>

         <td valign="bottom"><strong>Bibs</strong></td>
         <td valign="bottom"><strong>Hols</strong></td>
         <td valign="bottom"><strong>Items</strong></td>

         <td valign="bottom" align="center" colspan="4"><strong>Loans</strong></td>
       </tr>

       <tr style="font-family=Arial; font-size=8pt">
         <td colspan="7"></td>
         <td valign="top" align="center" colspan="2">Active</td>
         <td valign="top">Claims Returned</td>
         <td valign="top">Lost</td>
       </tr>

       <tr  style="font-family=Arial; font-size=8pt">
         <td colspan="7"></td>

         <td valign="top">Current</td>
         <td valign="top">Range</td>
         <td valign="bottom">Current</td>
         <td valign="bottom">Current</td>
         <td></td>
       </tr>
   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="body">

     <!-- Summary -->
     <xsl:call-template name="summary"/>

     <!-- Loop through unique inst -->
     <xsl:for-each select="loc[generate-id() =
                           generate-id(key('inst', substring(@sublibrary,1,2))[1])]">
  
       <xsl:variable name="inst" select="substring(@sublibrary,1,2)"/>
       <xsl:variable name="inst-nodes" select="key('inst', $inst)"/>
  
       <!-- Summarize the inst -->
       <xsl:call-template name="inst">
         <xsl:with-param name="inst" select="$inst"/>
         <xsl:with-param name="inst-nodes" select="$inst-nodes"/>
       </xsl:call-template>
  

       <!-- Loop through unique sublibrary -->
       <xsl:for-each select="($inst-nodes)[generate-id() =
                             generate-id(key('sublibrary', @sublibrary)[1])]">
  
         <xsl:variable name="sublibrary" select="@sublibrary"/>
         <xsl:variable name="sublibrary-nodes" select="key('sublibrary', $sublibrary)"/>
  
         <!-- Summarize the sublibrary -->
         <xsl:call-template name="sublibrary">
           <xsl:with-param name="sublibrary" select="$sublibrary"/>
           <xsl:with-param name="sublibrary-nodes" select="$sublibrary-nodes"/>
         </xsl:call-template>
  
         <!-- Loop through unique sublibrary/item status -->
         <xsl:for-each
              select="($sublibrary-nodes)[generate-id() =
              generate-id(key('status', concat($sublibrary,'--',@status))[1])]">

           <xsl:sort select="@status"/>
           <xsl:variable name="status" select="@status"/>
           <xsl:variable name="status-nodes" select="key('status', concat($sublibrary,'--',$status))"/>
         
           <!-- Summarize the item status -->
           <xsl:call-template name="status">
             <xsl:with-param name="sublibrary" select="$sublibrary"/>
             <xsl:with-param name="status" select="$status"/>
             <xsl:with-param name="status-nodes" select="$status-nodes"/>
           </xsl:call-template>

           <!-- Loop through unique sublibrary/item status/collection -->
           <xsl:for-each
                select="($status-nodes)[generate-id() =
                generate-id(key('collection', concat($sublibrary,'--',$status,'--',@collection))[1])]">
             <xsl:variable name="collection" select="@collection"/>
             <xsl:variable name="collection-nodes"
                           select="key('collection', concat($sublibrary,'--',$status,'--',$collection))"/>

             <!-- Summarize the collection -->
             <xsl:call-template name="collection">
               <xsl:with-param name="sublibrary" select="$sublibrary"/>
               <xsl:with-param name="status" select="$status"/>
               <xsl:with-param name="collection" select="$collection"/>
               <xsl:with-param name="collection-nodes" select="$collection-nodes"/>
             </xsl:call-template>
         
             <!-- List the locs -->
             <xsl:apply-templates select="$collection-nodes"/>

           </xsl:for-each>         
         </xsl:for-each>
       </xsl:for-each>
     </xsl:for-each>
   </xsl:template>



   <!-- ============================================================ -->

   <xsl:template name="inst">
     <xsl:param name="inst"/>
     <xsl:param name="inst-nodes"/>

     <tr>
       <td><br/></td>
       <td></td>
       <td></td>
       <td></td>

       <td id="vbar">&#160;</td>
       <td></td>
       <td></td>

       <td id="vbar">&#160;</td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
     </tr>

     <tr id="summary">
       <td><xsl:value-of select="$inst"/></td>
       <td>*</td>
       <td>*</td>
       <td>*</td>

       <td id="vbar">-</td>
       <td>-</td>
       <td><xsl:value-of select="sum($inst-nodes/items)"/></td>

       <td id="vbar"><xsl:value-of select="sum($inst-nodes/cur-loans-status-A)"/></td>
       <td><xsl:value-of select="sum($inst-nodes/range-loans-status-A)"/></td>
       <td><xsl:value-of select="sum($inst-nodes/cur-loans-status-C)"/></td>
       <td><xsl:value-of select="sum($inst-nodes/cur-loans-status-L)"/></td>
       <td></td>
     </tr>

   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="summary">

     <tr id="summary">
       <td>*</td>
       <td>*</td>
       <td>*</td>
       <td>*</td>

       <td id="vbar">-</td>
       <td>-</td>
       <td><xsl:value-of select="sum(loc/items)"/></td>

       <td id="vbar"><xsl:value-of select="sum(loc/cur-loans-status-A)"/></td>
       <td><xsl:value-of select="sum(loc/range-loans-status-A)"/></td>
       <td><xsl:value-of select="sum(loc/cur-loans-status-C)"/></td>
       <td><xsl:value-of select="sum(loc/cur-loans-status-L)"/></td>
       <td></td>
     </tr>

   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="sublibrary">
     <xsl:param name="sublibrary"/>
     <xsl:param name="sublibrary-nodes"/>

     <tr>
       <td><br/></td>
       <td></td>
       <td></td>
       <td></td>

       <td id="vbar">&#160;</td>
       <td></td>
       <td></td>

       <td id="vbar">&#160;</td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
     </tr>

     <tr id="summary">
       <td><xsl:value-of select="$sublibrary"/></td>
       <td>*</td>
       <td>*</td>
       <td>*</td>

       <td id="vbar">-</td>
       <td>-</td>
       <td><xsl:value-of select="sum($sublibrary-nodes/items)"/></td>

       <td id="vbar"><xsl:value-of select="sum($sublibrary-nodes/cur-loans-status-A)"/></td>
       <td><xsl:value-of select="sum($sublibrary-nodes/range-loans-status-A)"/></td>
       <td><xsl:value-of select="sum($sublibrary-nodes/cur-loans-status-C)"/></td>
       <td><xsl:value-of select="sum($sublibrary-nodes/cur-loans-status-L)"/></td>
       <td></td>
     </tr>

   </xsl:template>


   <!-- ============================================================ -->

   <xsl:template name="collection">
     <xsl:param name="sublibrary"/>
     <xsl:param name="status"/>
     <xsl:param name="collection"/>
     <xsl:param name="collection-nodes"/>

     <tr id="summary">
       <td><xsl:value-of select="$sublibrary"/></td>
       <td><xsl:value-of select="$status"/></td>
       <td><xsl:value-of select="$collection"/></td>
       <td>*</td>

       <td id="vbar">-</td>
       <td>-</td>
       <td><xsl:value-of select="sum($collection-nodes/items)"/></td>

       <td id="vbar"><xsl:value-of select="sum($collection-nodes/cur-loans-status-A)"/></td>
       <td><xsl:value-of select="sum($collection-nodes/range-loans-status-A)"/></td>
       <td><xsl:value-of select="sum($collection-nodes/cur-loans-status-C)"/></td>
       <td><xsl:value-of select="sum($collection-nodes/cur-loans-status-L)"/></td>
       <td></td>
     </tr>

   </xsl:template>



   <!-- ============================================================ -->

   <xsl:template name="status">
     <xsl:param name="sublibrary"/>
     <xsl:param name="status"/>
     <xsl:param name="status-nodes"/>

     <tr>
       <td><br/></td>
       <td></td>
       <td></td>
       <td></td>

       <td id="vbar">&#160;</td>
       <td></td>
       <td></td>

       <td id="vbar">&#160;</td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
     </tr>

     <tr id="summary">
       <td><xsl:value-of select="$sublibrary"/></td>
       <td><xsl:value-of select="$status"/></td>
       <td>*</td>
       <td>*</td>

       <td id="vbar">-</td>
       <td>-</td>
       <td><xsl:value-of select="sum($status-nodes/items)"/></td>

       <td id="vbar"><xsl:value-of select="sum($status-nodes/cur-loans-status-A)"/></td>
       <td><xsl:value-of select="sum($status-nodes/range-loans-status-A)"/></td>
       <td><xsl:value-of select="sum($status-nodes/cur-loans-status-C)"/></td>
       <td><xsl:value-of select="sum($status-nodes/cur-loans-status-L)"/></td>
       <td></td>
     </tr>

   </xsl:template>



   <!-- ============================================================ -->

   <xsl:template match="loc">
     <tr>
       <xsl:if test="@valid='false'">
         <xsl:attribute name="style">background: #eee;</xsl:attribute>
       </xsl:if>
       <td><xsl:value-of select="@sublibrary"/></td>
       <td><xsl:value-of select="@status"/></td>
       <td><xsl:value-of select="@collection"/></td>
       <td><xsl:value-of select="@material"/></td>

       <td id="vbar"><xsl:value-of select="bibs"/></td>
       <td><xsl:value-of select="hols"/></td>
       <td><xsl:value-of select="items"/></td>

       <td id="vbar"><xsl:value-of select="cur-loans-status-A"/></td>
       <td><xsl:value-of select="range-loans-status-A"/></td>
       <td><xsl:value-of select="cur-loans-status-C"/></td>
       <td><xsl:value-of select="cur-loans-status-L"/></td>
       <td>
         <xsl:if test="@valid='false'">* INVALID *</xsl:if>
       </td>
     </tr>
   </xsl:template>


</xsl:stylesheet>





