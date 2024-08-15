<?xml version="1.0"?> 

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0" 
>

   <xsl:template match="/list/entry">
      <xsl:element name="option">
         <xsl:attribute name="value">
            <xsl:value-of select="report"/>
         </xsl:attribute>
         <xsl:if test="selected">
            <xsl:attribute name="selected"/>
         </xsl:if>

         <xsl:value-of select="text"/>
      </xsl:element>
   </xsl:template>

</xsl:stylesheet>
