<?xml version="1.0"?>
<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:reports="Lookup table for reports"
   xmlns:inst="Institution long name lookup"
   version="1.0" 
>

   <xsl:output method="html"/>


   <!-- ================================================================= -->
   <!-- Input Parameters                                                  -->
   <!--                                                                   -->
   <!-- lib:    aleph library.                                            -->
   <!--                                                                   -->
   <!-- report: name of the loadbib report file; this should be the same  -->
   <!--         as the file provided as the input XML file.               -->
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
   <xsl:param name="report"/>
   <xsl:param name="campus" select="''"/>
   <xsl:param name="loader" select="unknown"/>
   <xsl:param name="uri" select="''"/>
   <xsl:param name="category" select="''"/>


   <!-- ================================================================= -->
   <!-- List of institution long names.                                   -->

   <inst:inst>
      <Unknown   long="Unknown"/>
      <BS        long="Bowie State University"/>
      <CE        long="Center for Environmental Science"/>
      <CS        long="Coppin State College"/>
      <FS        long="Frostburg State University"/>
      <MS        long="Morgan State University"/>
      <SU        long="Salisbury State University"/>
      <SM        long="St. Mary's College of Maryland"/>
      <TU        long="Towson University"/>
      <UB        long="University of Baltimore"/>
      <BL        long="University of Baltimore Law Library"/>
      <BC        long="UMBC"/>
      <CP        long="University of Maryland, College Park"/>
      <ES        long="University of Maryland Eastern Shore"/>
      <HS        long="University of Maryland, Baltimore, Health Sciences and Human Services"/>
      <ML        long="University of Maryland Law Library"/>
      <UC        long="University of Maryland University College"/>
   </inst:inst>


   <!-- ================================================================= -->
   <!-- List of all reports.                                              -->

   <reports:reports>
      <new  short="New"      title="New Records"/>
      <overlay  short="Overlay"  title="Records which overlaid existing records"/>
      <overlaid   short="Overlaid" title="Records overlaid by incoming records"/>
		<noXPTadded short="No XPT" title="No XPT added to the record"/>
      <rejected   short="Rejected" title="Rejected Records"/>
		<defholcreated short="Def Hol created" title="Default Hol created"/> 
      <holnotcreated short="Hol not created" title="Hol not created"/>
		<defitemcreated short="Def Item created" title="Default Item created"/>
      <itemnotcreated short="Item not created" title="Item not created"/>
      <newnohol   short="New w/o HOL" title="New records loaded without HOL record"/>
      <newnoitem  short="New w/o Item" title="New records loaded without Item record"/>
      <biblvls    short="Records with bib lvl='s'" title="Records with bib lvl='s'"/>
   </reports:reports>


   <!-- ================================================================= -->
   <!-- Top level match of the loadbib report.                            -->

   <xsl:template match="/loadbib-report">

      <!-- Introduction -->
      <h1>
         loadbib report for xxx
         <xsl:value-of select="$lib"/>:<xsl:value-of select="$loader"/>
      </h1>

      <p>
         <b>
            Institution: 
            <xsl:choose>
               <xsl:when test="$campus = ''">
                  All
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="document('')/*/inst:inst/*[name() = $campus]/@long"/>
               </xsl:otherwise>
            </xsl:choose>
         </b>
      </p>

      <table width="98%">
      <tr>
         <td align="left" width="15%">Start time:</td>
         <td align="left"><xsl:value-of select="start"/></td>
      </tr>
      <tr>
         <td align="left">Stop time:</td>
         <td align="left"><xsl:value-of select="stop"/></td>
      </tr>
      </table>

      <xsl:choose>
         <xsl:when test="$category = ''">
            <!-- Summary count for each category -->
            <h3>Summary Counts</h3>
            <table width="98%">
              <tr>
                 <td width="25%">Total records processed</td>
                 <td>
                    <xsl:value-of select="count(document($report)/loadbib-report/record/institution[starts-with(text(),$campus)])"/>
                 
                 </td>
              </tr>

               <xsl:for-each select="document('')/*/reports:reports/*">
                  <xsl:call-template name="summarizeCategory">
                     <xsl:with-param name="category" select="name()"/>
                  </xsl:call-template>      
               </xsl:for-each>
            </table>
            
            <!-- Report each category -->
            <table width="98%">
               <!-- Define the column widths -->
               <tr>
                  <td width="1%"></td>
                  <td width="2%"></td>
                  <td width="75%"></td>
                  <td width="2%"></td>
                  <td width="10%"></td>
                  <td width="10%"></td>
               </tr>
            
               <xsl:for-each select="document('')/*/reports:reports/*">
                  <xsl:call-template name="reportCategory">
                     <xsl:with-param name="category" select="name()"/>
                  </xsl:call-template>      
               </xsl:for-each>
            </table>
         </xsl:when>
         <xsl:otherwise>

            <!-- Report the 1 category -->
            <table width="98%">
               <!-- Define the column widths -->
               <tr>
                  <td width="1%"></td>
                  <td width="2%"></td>
                  <td width="75%"></td>
                  <td width="2%"></td>
                  <td width="10%"></td>
                  <td width="10%"></td>
               </tr>
            
               <xsl:call-template name="reportCategory">
                  <xsl:with-param name="category" select="$category"/>
               </xsl:call-template>      
            </table>
         </xsl:otherwise>
      </xsl:choose>

   </xsl:template>


   <!-- ================================================================= -->
   <!-- Summarize a category                                              -->

   <xsl:template name="summarizeCategory">
      <xsl:param name="category"/>
         <xsl:if test="document($report)/loadbib-report/record/institution[starts-with(text(),$campus)]/following-sibling::*[name() = $category]">
            <tr>
               <td width="25%">
                 <xsl:element name="a">
                    <xsl:attribute name="href">
                      <xsl:value-of select="$uri"/>
                      <xsl:text>&amp;category=</xsl:text>
                      <xsl:value-of select="$category"/> 
                    </xsl:attribute>
                    <xsl:value-of select="document('')/*/reports:reports/*[name() = $category]/@short"/>
                 </xsl:element>
               </td>
               <td><xsl:value-of select="count(document($report)/loadbib-report/record/institution[starts-with(text(),$campus)]/following-sibling::*[name() = $category])"/></td>
            </tr>
         </xsl:if>
   </xsl:template>


   <!-- ================================================================= -->
   <!-- Report a category                                                 -->

   <xsl:template name="reportCategory">
      <xsl:param name="category"/>

      <!-- Are there any records with this category? -->
      <xsl:if test="document($report)/loadbib-report/record/institution[starts-with(text(),$campus)]/following-sibling::*[name() = $category]">
         <!-- Separator -->
         <tr><td colspan="6"><hr></hr></td></tr>

         <!-- Category title -->
         <tr><td colspan="6">
         <h3>
           <xsl:element name="a">
             <xsl:attribute name="name">
               <xsl:value-of select="$category"/> 
             </xsl:attribute>
             <xsl:value-of select="document('')/*/reports:reports/*[name() = $category]/@title"/>
           </xsl:element>
         </h3>
         </td></tr>

         <!-- List matching records -->
         <xsl:for-each select="document($report)/loadbib-report/record/institution[starts-with(text(),$campus)]/following-sibling::*[name() = $category]">
            <tr>
              <td></td>
              <td valign="top"><xsl:value-of select="position()"/></td>
              <td valign="top">
                <xsl:value-of select="preceding-sibling::title/text()"/>
                <xsl:if test=".">
                  <br></br>
                  <table width="100%">
                    <tr>
                      <td width="3%"></td>
                      <td>
                        <font size="-1"><xsl:value-of select="text()"/></font>
                        <xsl:apply-templates select="pre"/>
                      </td>
                    </tr>
                  </table>
                </xsl:if>
              </td>
              <td valign="top">
                 <font size="-1">
                    <xsl:choose>
                       <xsl:when test="preceding-sibling::institution/text() = 'Unknown'">
                          ??
                       </xsl:when>
                       <xsl:otherwise>
                          <xsl:value-of select="preceding-sibling::institution/text()"/>
                       </xsl:otherwise>
                    </xsl:choose>
                 </font>
              </td>
              <td valign="top">
                <font size="-1">
                  <xsl:value-of
                  select="preceding-sibling::docnum-in/text()"/>
                </font>
              </td>
              <td valign="top">
                <font size="-1">
                  <xsl:value-of
                  select="following-sibling::docnum-out/text()"/> 
                </font>
              </td>
            </tr>
         </xsl:for-each>
      </xsl:if>
   </xsl:template>


   <!-- ================================================================= -->
   <!-- Report a category                                                 -->

   <xsl:template match="pre">
      <pre>
         <xsl:value-of select="text()"/>
      </pre>
   </xsl:template>

</xsl:stylesheet>


