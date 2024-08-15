<%----------------------------------------------------------------------%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="edu.umd.lims.aleph.*" %>
<%@ page import="org.apache.xalan.xslt.*" %>

<%@ taglib uri="http://jakarta.apache.org/taglibs/xtags-1.0" prefix="xt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>


<%----------------------------------------------------------------------%>

<jsp:useBean class="edu.umd.lims.aleph.circstats.report.Report" id="crep"
             scope="session"/>
<jsp:setProperty name="crep" property="*"/>

<%
   if (request.getParameter("category") == null)
      crep.setCategory("");
%>


<%----------------------------------------------------------------------%>


<%
  String strNav = "&nbsp; <a href=\"list.jsp\" title=\"return\" class=\"menu\">" +
                  crep.getCampus();  
%>

<jsp:include page="header.jsp">
  <jsp:param name="nav" value="<%= strNav %>"/>
</jsp:include>

<% pageContext.setAttribute("xml", crep.getXmlReader()); %>
<c:import var="xsl" url="report.xsl"/>

<x:transform doc="${xml}" xslt="${xsl}">
  <x:param name="reports"   value="<%= crep.getReportsFile() %>"/>
  <x:param name="lib"       value="<%= crep.getLib() %>"/>
  <x:param name="loader"    value="<%= crep.getLoader() %>"/>
  <x:param name="campus"    value="<%= crep.getCampus() %>"/>
  <x:param name="uri"       value="<%= request.getRequestURI() + \"?\" %>"/>
  <x:param name="category"  value="<%= crep.getCategory() %>"/>
</x:transform>

<%@ include file="footer.jsp" %>

