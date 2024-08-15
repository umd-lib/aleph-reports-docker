<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

  <!-- ================================================================= -->
  <!-- Library of Lims XSLT templates.                                   -->
  <!--                                                                   -->
  <!-- Revision History                                                  -->
  <!--                                                                   -->
  <!--   2003/09/23: Ben                                                 -->
  <!--     - add 'all' option                                            -->
  <!--                                                                   -->


  <!-- ================================================================= -->
  <!-- Expand a campus 2 letter code to a long description.              -->

  <xsl:template name="expandCampus">
    <xsl:param name="code"/>

    <xsl:choose>
      <xsl:when test="$code = 'all'">
        <xsl:text>All</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'BS'">
        <xsl:text>Bowie State University</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'CP'">
        <xsl:text>University of Maryland, College Park</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'CE'">
        <xsl:text>Center for Environmental Science</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'CS'">
        <xsl:text>Coppin State University</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'FS'">
        <xsl:text>Frostburg State University</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'LN'">
        <xsl:text>Loyola Notre Dame Library</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'MS'">
        <xsl:text>Morgan State University</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'SU'">
        <xsl:text>Salisbury University</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'SM'">
        <xsl:text>St. Mary's College of Maryland</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'TU'">
        <xsl:text>Towson University</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'UB'">
        <xsl:text>University of Baltimore</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'BL'">
        <xsl:text>University of Baltimore Law Library</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'BC'">
        <xsl:text>UMBC</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'ES'">
        <xsl:text>University of Maryland Eastern Shore</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'HS'">
        <xsl:text>University of Maryland Health Sciences and Human Services Library</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'ML'">
        <xsl:text>University of Maryland Law Library</xsl:text>
      </xsl:when>
      <xsl:when test="$code = 'UC'">
        <xsl:text>University of Maryland Global Campus</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>??</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


</xsl:stylesheet>


