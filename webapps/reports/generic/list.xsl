<?xml version="1.0"?> 

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0" 
>

   <xsl:template match="/list">

      <select name="file" size="15">

      <xsl:for-each select="entry">
         <xsl:element name="option">
         	<xsl:attribute name="value">
         		<xsl:value-of select="file"/>
         	</xsl:attribute>
         	<xsl:if test="selected">
         		<xsl:attribute name="selected"/>
         	</xsl:if>
		   
         	<xsl:value-of select="text"/>
         </xsl:element>
      </xsl:for-each>

      </select>

   </xsl:template>

</xsl:stylesheet>
