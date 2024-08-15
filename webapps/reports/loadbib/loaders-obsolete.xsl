<?xml version="1.0"?> 

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0" 
>

  <xsl:template match="/index">
    <table>
    <xsl:for-each select="obsolete/loader">
      <tr>
        <td width="15%"></td> 
        <td>

          <!-- Link to the each loader report -->
          <xsl:element name="a">
             <xsl:attribute name="href">
               <xsl:text>list.jsp?lib=</xsl:text>
               <xsl:value-of select="@lib"/> 
               <xsl:text>&amp;loader=</xsl:text>
               <xsl:value-of select="@loader"/> 
             </xsl:attribute>

             <xsl:value-of select="@lib"/> 
             <xsl:text>: </xsl:text>
             <xsl:value-of select="@loader"/> 

          </xsl:element>
        </td>
      </tr>
    </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>
