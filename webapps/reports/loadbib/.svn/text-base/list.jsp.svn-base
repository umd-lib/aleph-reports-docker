<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="edu.umd.lims.aleph.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>

<%-- Beans --%>

<jsp:useBean class="edu.umd.lims.aleph.loadbib.report.Report" id="lrep"
             scope="session"/>
<jsp:setProperty name="lrep" property="*"/>


<%-- Page --%>

<%@ include file="header.jsp" %>

<form method="get" action="report.jsp">
<dev align="center">
<table width="95%">
<td width="50%" valign="top">

<h3>Choose a report</h3>
<font size=-1>The timestamp is the time the loader was started</font><br>

<select name="report" size="15">

  <c:set var="xml">
    <jsp:getProperty name="lrep" property="reportList"/>
  </c:set>
  <c:import var="xsl" url="list.xsl"/>
  <x:transform xml="${xml}" xslt="${xsl}"/>

</select>


</td>
<td width="50%" valign="top">

<table>
  <tr>
    <td width="60%"><h3>Choose a format for display</h3></td>
    <td>
      <input type=radio checked name="format" value="html"> HTML
      <input type=radio name="format" value="xml"> XML
    </td>
  </tr>

  <tr>
    <td><h3>Choose segmentation</h3></td>
    <td>
      <input type=radio checked name="category" value="all"> No
      <input type=radio name="category" value="summary"> Yes
    </td>
  </tr>

  <tr>
    <td colspan="2">
      <h3>Choose an institution</h3>
      <font size=-1>The institution is only relevant for the HTML display option<br>
  
      <c:import var="xml" url="campuses.xml"/>
      <c:import var="xsl" url="campuses.xsl"/>
      <x:transform xml="${xml}" xslt="${xsl}">
      	<x:param name="selected" value="<%= lrep.getCampus() %>"/>
      </x:transform>
    </td>
  </tr>
</table>

</td>
</table>
</div>

<br></br>

<input type=submit value="Get Report">

</form>

<%@ include file="footer.jsp" %>
