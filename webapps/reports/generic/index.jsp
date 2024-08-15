<%@ page language="java" contentType="text/html" %>

<%@ taglib uri="http://jakarta.apache.org/taglibs/xtags-1.0" prefix="xt" %>


<%-- Beans --%>


<jsp:useBean class="edu.umd.lims.aleph.Report"
             id="srep" scope="session"/>
<jsp:setProperty name="srep" property="beanName" value=""/>
<jsp:setProperty name="srep" property="beanName"/>


<% pageContext.removeAttribute("rep", PageContext.SESSION_SCOPE); %>
<jsp:useBean beanName="<%= srep.getBeanName() %>" 
             type="edu.umd.lims.aleph.Report"
             id="rep" scope="session"/>
<jsp:setProperty name="rep" property="report"   param="report"/>
<jsp:setProperty name="rep" property="campus"   param="campus"/>
<jsp:setProperty name="rep" property="lib"      param="lib"/>
<jsp:setProperty name="rep" property="file"     value=""/>
<jsp:setProperty name="rep" property="format"   value=""/>

<% 
  // Bypass this page if the library has already been requested
  String strLib = rep.getLib();
  if (strLib != null && !strLib.equals("")) {
    %>
    <jsp:forward page="list.jsp"/>
    <%
  }
%>


<%-- Page --%>

<jsp:include page="header.jsp"/>

Available Libraries

<xt:style xml="reports.xml" xsl="reports.xsl">
  <xt:param name="report"><%= rep.getReport() %></xt:param>
</xt:style>

<%@ include file="footer.jsp" %>

