<?xml version="1.0"?> 

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0" 
>

  <xsl:template match="/index">
    <table>
    <xsl:for-each select="campus">
      <tr>
        <td width="15%"></td> 
        <td>

          <!-- Link to circ stats for each campus -->
          <xsl:element name="a">
             <xsl:attribute name="href">
               <xsl:text>list.jsp?lib=mai50&amp;campus=</xsl:text>
               <xsl:value-of select="@inst"/> 
             </xsl:attribute>

             <xsl:value-of select="@name"/> 

          </xsl:element>
        </td>
      </tr>
    </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>
