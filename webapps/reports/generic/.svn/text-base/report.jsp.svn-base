<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://jakarta.apache.org/taglibs/xtags-1.0" prefix="xt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>


<%-- Beans --%>

<jsp:useBean class="edu.umd.lims.aleph.Report"
             id="srep" scope="session"/>

<jsp:useBean beanName="<%= srep.getBeanName() %>" 
             type="edu.umd.lims.aleph.Report"
             id="rep" scope="session"/>
<jsp:setProperty name="rep" property="*"/>


<%-- Page --%>

<% if (rep.getFormat() != null && rep.getFormat().equals("xml")) { %>
  <jsp:forward page="report-xml.jsp"/>
<% } %>

<%
  String strNav = "&nbsp; <a href=\"list.jsp\" title=\"return\" class=\"menu\">" + rep.getLib();  
%>

<jsp:include page="header.jsp">
  <jsp:param name="nav" value="<%= strNav %>"/>
</jsp:include>

<% pageContext.setAttribute("xml", rep.getXmlReader()); %>
<c:import var="xsl" url="<%= rep.getXslFile() %>"/>

<x:transform doc="${xml}" xslt="${xsl}">
  <x:param name="campus" value="<%= rep.getCampus() %>"/>
</x:transform>

<%@ include file="footer.jsp" %>

