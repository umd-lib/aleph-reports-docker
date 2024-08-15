<?xml version="1.0"?>
<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0" 
>


   <xsl:output method="html"/>


   <!-- ================================================================= -->
   <!-- Input Parameters                                                  -->
   <!--                                                                   -->
   <!-- lib:    aleph library.                                            -->
   <!--                                                                   -->
   <!-- reports: location of reports.xsl which contains the list of       -->
   <!--          reports to display for a specific loader                 -->
   <!--                                                                   -->
   <!-- campus: which campus to report; a blank ('') means do all         -->
   <!--         campuses                                                  -->
   <!--                                                                   -->
   <!-- loader: name of this loader, eg ongoing, govdoc, etc.             -->
   <!--                                                                   -->
   <!-- uri:    uri of the current request                                -->
   <!--                                                                   -->
   <!-- category: category to report (blank for all)                      -->
   <!--                                                                   -->

   <xsl:param name="lib"/>
   <xsl:param name="reports"/>
   <xsl:param name="campus" select="''"/>
   <xsl:param name="loader" select="unknown"/>
   <xsl:param name="uri" select="''"/>
   <xsl:param name="category" select="''"/>

   <!-- ================================================================= -->
   <!-- Top level match of the loadbib report.                            -->

   <xsl:template match="/report">
     <font size="+0">
       <pre><xsl:value-of select = "stats"/><xsl:value-of select = "text"/></pre>
     </font>
   </xsl:template>
                                
</xsl:stylesheet>


