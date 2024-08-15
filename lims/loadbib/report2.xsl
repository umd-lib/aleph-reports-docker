<?xml version="1.0"?>
<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0" 
>

   <!-- ================================================================= -->
   <!-- Handle loadbib reports, version 2.0                               -->

   <xsl:variable 
       name="all2"
       select="/loadbib-report/record[perrecord/reports/institution[text() = $campus] or $campus = '']"
   />

   <xsl:key name="categories2" 
            match="/loadbib-report/record/*/reports[institution[text()=$campus or $campus='']]/*[name() != 'institution']" 
            use="name()"
   />

   <xsl:template name="loadbib-report-2">
      
      <!-- Introduction -->
      <h1>
         loadbib report for 
         <xsl:value-of select="$lib"/>:<xsl:apply-templates select="loadbib-title"/>
      </h1>

      <p>
         <b>
            Institution: 
            <xsl:choose>
               <xsl:when test="$campus = ''">
                  All
               </xsl:when>
               <xsl:otherwise>
                  <xsl:call-template name="expandCampus">
                     <xsl:with-param name="code" select="$campus"/>
                  </xsl:call-template>      
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
        <xsl:when test="$category = 'all' or $category='summary'">

          <!-- Summary count for each category -->
          <h3>Summary Counts</h3>
          <table width="98%">
            <tr>
               <td width="25%">Total records processed</td>
               <td>
          	  <xsl:value-of select="count($all2)"/>
               </td>
            </tr>
          
            <xsl:for-each select="$reps/*">
               <xsl:call-template name="summarizeCategory2">
          	  <xsl:with-param name="category" select="name()"/>
               </xsl:call-template>      
            </xsl:for-each>
          </table>
        </xsl:when>

        <xsl:otherwise>
          <!-- Link back to summary -->
           <xsl:element name="a">
             <xsl:attribute name="href">
               <xsl:value-of select="$uri"/>
               <xsl:text>category=summary</xsl:text>
             </xsl:attribute>
             <h3>Summary Counts</h3>
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
        
      <xsl:if test="$category != 'summary'">          

        <!-- Report categories -->
        <table width="98%">
           <!-- Define the column widths -->
           <tr>
                <td width="1%"></td>
                <td width="2%"></td>
                <td width="85%"></td>
                <td width="2%"></td>
                <td width="10%"></td>
           </tr>
        
           <xsl:choose>
             <xsl:when test="$category = 'all'">
               <!-- Report every category -->
               <xsl:for-each select="$reps/*">
               	 <xsl:call-template name="reportACategory2">
               	   <xsl:with-param name="category" select="name()"/>
               	 </xsl:call-template>      
               </xsl:for-each>
             </xsl:when>

             <xsl:otherwise>
               <!-- Report 1 category -->
               <xsl:call-template name="reportACategory2">
                 <xsl:with-param name="category" select="$category"/>
               </xsl:call-template>      
             </xsl:otherwise>
          </xsl:choose>

        </table>
      </xsl:if>
   </xsl:template>


   <!-- ================================================================= -->
   <!-- Summarize a category                                              -->

   <xsl:template name="summarizeCategory2">
      <xsl:param name="category"/>

      <xsl:for-each select="$all2/..">

         <!-- Get the node count -->
         <xsl:variable name="count">
           <xsl:choose>
             <xsl:when test="$category='rejected-ov'">
               <xsl:value-of select="count(key('categories2','rejected')[starts-with(text(),'Overlay rejected')])"/>
             </xsl:when>
             <xsl:when test="$category='rejected-er'">
               <xsl:value-of select="count(key('categories2','rejected')[not(starts-with(text(),'Overlay rejected'))])"/>
             </xsl:when>
             <xsl:otherwise>
               <xsl:value-of select="count(key('categories2',$category))"/>
             </xsl:otherwise>
           </xsl:choose>
         </xsl:variable>
      
         <xsl:if test="$count > 0">
            <tr>
               <td width="25%">
                  <xsl:element name="a">
                    <xsl:attribute name="href">
                      <xsl:choose>
                        <xsl:when test="$glcategory = 'all'">
                          <xsl:text>#</xsl:text>
                          <xsl:value-of select="$category"/> 
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="$uri"/>
                          <xsl:text>category=</xsl:text>
                          <xsl:value-of select="$category"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <xsl:value-of select="$reps/*[name() = $category]/@short"/>
                 </xsl:element>
               </td>
               <td><xsl:value-of select="$count"/></td>
            </tr>
         </xsl:if>

      </xsl:for-each>

   </xsl:template>


   <!-- ================================================================= -->
   <!-- Report a category                                                 -->

   <xsl:template name="reportACategory2">
      <xsl:param name="category"/>

    <xsl:for-each select="$all2/..">

      <xsl:choose>
         <xsl:when test="$category='rejected-ov'">
            <xsl:call-template name="reportCategory2">
               <xsl:with-param name="category" select="$category"/>
               <xsl:with-param name="set" select="key('categories2','rejected')[starts-with(text(),'Overlay rejected')]"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="$category='rejected-er'">
            <xsl:call-template name="reportCategory2">
               <xsl:with-param name="category" select="$category"/>
               <xsl:with-param name="set" select="key('categories2','rejected')[not(starts-with(text(),'Overlay rejected'))]"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>
            <xsl:call-template name="reportCategory2">
               <xsl:with-param name="category" select="$category"/>
               <xsl:with-param name="set" select="key('categories2',$category)"/>
            </xsl:call-template>
         </xsl:otherwise>
      </xsl:choose>

    </xsl:for-each>

   </xsl:template>

   <!-- ================================================================= -->

   <xsl:template name="reportCategory2">
      <xsl:param name="category"/>
      <xsl:param name="set"/>

      <xsl:for-each select="$all2/..">
      
         <!-- Get the node count -->
         <xsl:variable name="count" select="count($set)"/>

         <!-- Are there any records with this category? -->
         <xsl:if test="$count > 0">
            <!-- Separator -->
            <tr><td colspan="6"><hr></hr></td></tr>
         
            <!-- Category title -->
            <tr><td colspan="6">
            <h3>
              <xsl:element name="a">
                <xsl:attribute name="name">
                  <xsl:value-of select="$category"/> 
                </xsl:attribute>
                <xsl:value-of select="$reps/*[name() = $category]/@title"/>
              </xsl:element>
            </h3>
            </td></tr>
         
            <!-- List matching records -->

            <xsl:for-each select="$set">
               <tr>
                 <td></td>
                 <td valign="top"><xsl:value-of select="position()"/></td>
                 <td valign="top">
                   <xsl:value-of select="../../../title"/>
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
                 <td valign="top" nowrap="true">
                    <font size="-1">
		      <xsl:for-each select="../institution">
		        <xsl:value-of select="."/>
			<xsl:choose>
		          <xsl:when test="(position() mod 2) = 0">
		            <br/>
		          </xsl:when>
			  <xsl:otherwise>
			    <xsl:value-of select="' '"/>
			  </xsl:otherwise>
			</xsl:choose>
                      </xsl:for-each>
                    </font>
                 </td>
                 <td valign="top">
                   <font size="-1">
<!--
                     <xsl:value-of select="../../../perrecord/docnum-in"/>
		     <br/>
-->
                     <xsl:value-of select="../../../*/docnum-out"/> 
                   </font>
                 </td>
               </tr>
            </xsl:for-each>
         </xsl:if>
      </xsl:for-each>
   </xsl:template>


</xsl:stylesheet>


