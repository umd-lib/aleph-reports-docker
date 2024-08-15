<?xml version="1.0"?> 

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0" 
>

  <xsl:param name="report"/>

  <xsl:template match="/root">
    <table>
    <xsl:for-each select="report">
      <xsl:if test="$report = @value">
        <tr>
        	 <td width="15%"></td> 
        	 <td>
		  
        		<!-- Link to the each report -->
        		<xsl:element name="a">
        			<xsl:attribute name="href">
        			  <xsl:text>list.jsp?lib=</xsl:text>
        			  <xsl:value-of select="@lib"/> 
        			</xsl:attribute>
		  
        			<xsl:value-of select="@lib"/> 
		  
        		</xsl:element>
        	 </td>
        </tr>
      </xsl:if>
    </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>
