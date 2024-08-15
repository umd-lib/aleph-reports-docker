<%----------------------------------------------------------------------%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="edu.umd.lims.aleph.*" %>
<%@ page import="org.apache.xalan.xslt.*" %>

<%@ taglib uri="http://jakarta.apache.org/taglibs/xtags-1.0" prefix="xt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>


<%----------------------------------------------------------------------%>

<jsp:useBean class="edu.umd.lims.aleph.loadbib.report.Report" id="lrep"
             scope="session"/>
<jsp:setProperty name="lrep" property="*"/>

<%
   if (request.getParameter("category") == null)
      lrep.setCategory("");
%>


<%----------------------------------------------------------------------%>

<% if (lrep.getFormat() != null && lrep.getFormat().equals("xml")) { %>
  <jsp:forward page="report-xml.jsp"/>
<% } %>

<%
  String strNav = "&nbsp; <a href=\"list.jsp\" title=\"return\" class=\"menu\">" +
                  lrep.getLib() + ":" + lrep.getLoader();  
%>

<jsp:include page="header.jsp">
  <jsp:param name="nav" value="<%= strNav %>"/>
</jsp:include>

<% pageContext.setAttribute("xml", lrep.getXmlReader()); %>
<c:import var="xsl" url="report.xsl"/>

<x:transform doc="${xml}" xslt="${xsl}">
  <x:param name="reports"   value="<%= lrep.getReportsFile() %>"/>
  <x:param name="lib"       value="<%= lrep.getLib() %>"/>
  <x:param name="loader"    value="<%= lrep.getLoader() %>"/>
  <x:param name="campus"    value="<%= lrep.getCampus() %>"/>
  <x:param name="uri"       value="<%= request.getRequestURI() + \"?\" %>"/>
  <x:param name="category"  value="<%= lrep.getCategory() %>"/>
</x:transform>

<%@ include file="footer.jsp" %>

