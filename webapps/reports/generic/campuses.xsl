<?xml version="1.0"?> 

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0" 
>

  <xsl:param name="selected"/>

  <xsl:template match="/root">

    <select name="campus" size="18">

    <xsl:for-each select="campus">

      <xsl:element name="option">
         <xsl:attribute name="value">
           <xsl:value-of select="@value"/>
         </xsl:attribute>
		
         <xsl:if test="@value = $selected">
            <xsl:attribute name="selected"/>
         </xsl:if>

         <xsl:value-of select="@name"/> 
      </xsl:element>

    </xsl:for-each>
    </select>
  </xsl:template>

</xsl:stylesheet>
