<?xml version="1.0"?>

<!-- ================================================================= -->
<!--                                                                   -->
<!--   2004/04/12: Zarzar                                              -->
<!--     - initial version                                             -->
<!--                                                                   -->
<!-- ================================================================= -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java">

   <xsl:output method="text" encoding="utf8"/>

   <!-- Java extension utility -->
   <xsl:variable name="x" select="java:edu.umd.lims.util.Xalan.new()"/>

   <!-- key for unique budget amount-total count -->
   <xsl:key name="budget" match="section-02" use="z76-budget-number"/>

   <!-- ============================================================ -->

   <xsl:template match="printout">

     <!-- Header -->
     <xsl:call-template name="header"/>

     <!-- List of transactions -->
     <xsl:call-template name="body"/>

     <!-- Sum each unique budget total amount -->
     <xsl:call-template name="budget-amount"/>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template name="header">
     <!-- Header -->
     <xsl:text>&#10;</xsl:text>
     <xsl:value-of select="section-01/report-title"/>
     <xsl:text>&#10;&#10;</xsl:text>
     <xsl:text>Report Date: </xsl:text><xsl:value-of select = "section-01/report-date"/>
     <xsl:text>&#10;</xsl:text>
     <xsl:text>Transactions Period: </xsl:text><xsl:value-of select = "section-01/report-date-range"/>
     <xsl:text>&#10;&#10;</xsl:text>

     <xsl:text>BUDGET          TITLE                                              ORDER NUMBER    ST DATE       CP AMOUNT    VENDOR               REQUESTOR NAME  &#10;</xsl:text>
     <xsl:text>--------------- -------------------------------------------------- --------------- -- ---------- -- --------- -------------------- -------------------- &#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template name="body">
     <xsl:variable name = "sort-value" select = "section-01/report-sort"/>

     <xsl:choose>
       <xsl:when test = "$sort-value = 'non-default'">
         <xsl:apply-templates select = "section-02">
           <xsl:sort select = "z76-budget-number"/>
           <xsl:sort select = "z68-target-text"/>
           <xsl:sort select = "z13-title"/>
         </xsl:apply-templates>
       </xsl:when>
       <xsl:when test = "$sort-value = 'budget'">
         <xsl:apply-templates select = "section-02">
           <xsl:sort select = "z76-budget-number"/>
         </xsl:apply-templates>
       </xsl:when>
       <xsl:when test = "$sort-value = 'title'">
          <xsl:apply-templates select = "section-02">
            <xsl:sort select = "z13-title"/>
           </xsl:apply-templates>
       </xsl:when>
       <xsl:when test = "$sort-value = 'requestor'">
         <xsl:apply-templates select = "section-02">
           <xsl:sort select = "z68-target-text"/>
         </xsl:apply-templates>
       </xsl:when>
       <xsl:otherwise>
         <xsl:apply-templates select = "section-02">
           <xsl:sort select = "z76-budget-number"/>
           <xsl:sort select = "z13-title"/>
           <xsl:sort select = "z68-target-text"/>
         </xsl:apply-templates>
       </xsl:otherwise>
     </xsl:choose>
     <xsl:text>&#10;&#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template match="section-02">
     <xsl:value-of select="java:pad( $x, z76-budget-number, 15 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad( $x, z13-title, 50 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad( $x, z68-order-number, 15 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad( $x, z68-order-status, 2 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad( $x, z68-order-status-date, 10 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad( $x, z68-no-units, 2 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad( $x, format-number( z601-local-sum, '$00.00' ), 9 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad( $x, z70-vendor-name, 20 )"/>
     <xsl:text> </xsl:text>
     <xsl:value-of select="java:pad( $x, z68-target-text, 20 )"/>
     <xsl:text>&#10;</xsl:text>
   </xsl:template>

   <!-- ============================================================ -->

   <xsl:template name="budget-amount">
     <xsl:text>Budgets Total:</xsl:text>
     <xsl:text>&#10;</xsl:text>
     <xsl:text>--------------</xsl:text>
     <xsl:text>&#10;</xsl:text>
     <xsl:for-each select="section-02[generate-id() =
                           generate-id( key( 'budget', z76-budget-number )[1] )]">
       <xsl:value-of select="java:pad( $x, z76-budget-number, 15 )"/>
       <xsl:text> </xsl:text>
       <xsl:value-of select="format-number( sum( key( 'budget', z76-budget-number )/z601-local-sum ), '$00.00' )"/>
       <xsl:text>&#10;</xsl:text>
     </xsl:for-each>
   </xsl:template>
</xsl:stylesheet>
