<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="edu.umd.lims.aleph.*" %>

<%@ taglib uri="http://jakarta.apache.org/taglibs/xtags-1.0" prefix="xt" %>


<%-- Beans --%>

<jsp:useBean class="edu.umd.lims.aleph.Report"
             id="srep" scope="session"/>

<jsp:useBean beanName="<%= srep.getBeanName() %>" 
             type="edu.umd.lims.aleph.Report"
             id="rep" scope="session"/>
<jsp:setProperty name="rep" property="*"/>


<%-- Page --%>

<jsp:include page="header.jsp"/>

<form method="get" action="report.jsp">

  <table width="95%">
      <tr>
        <td width="50%" valign="top">
        
          <h3>Choose a report</h3>
          
          <xt:style xsl="list.xsl">
            <jsp:getProperty name="rep" property="reportList"/>
          </xt:style>
        
        </td>
        
        <td width="50%" valign="top">
        
          <h3>Choose a format for display</h3>
          <input type=radio checked name="format" value="html"> HTML
          <input type=radio name="format" value="xml"> XML
          
          <br></br>
          
        <% if (rep.getCampus() != null) { %>
          <h3>Choose an institution</h3>
          <font size=-1>
            The institution is only relevant for the HTML display option
          </font>
          <br></br>

          <xt:style xsl="campuses.xsl" xml="campuses.xml">
            <xt:param name="selected"><%= rep.getCampus() %></xt:param>
          </xt:style>
          <br></br>
 
        <% } %>

          <input type=submit value="Get Report">
        
        </td>
      </tr>
  </table>

</form>

<%@ include file="footer.jsp" %>





