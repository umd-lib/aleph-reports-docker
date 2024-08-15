<%@ page language="java" contentType="text/html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>

<%-- Bean Declarations --%>

<%-- Page --%>

<%-- Check for the 'files' parameter --%>

<c:if test="${!empty param.file}">

  <%-- Read in files.xml --%>
  <c:import url="files.xml" var="configxml" />
  <x:parse xml="${configxml}" var="configxmln"/>

  <%-- Check for the file entry in files.xml --%>
  <x:if select="$configxmln/root/file[@tag=$param:file]"> 

    <%-- Get the xml file --%>
    <c:set var="xmlfile">
      <x:out select="$configxmln/root/file[@tag=$param:file]/@xml"/>
    </c:set>

    <%-- Get the xsl file --%>
    <c:set var="xslfile">
      <x:out select="$configxmln/root/file[@tag=$param:file]/@xsl"/>
    </c:set>

    <%-- Execute the transformation --%>
    <c:import var="xml" url="file:${xmlfile}"/>
    <c:import var="xsl" url="${xslfile}"/>
    <x:transform xml="${xml}" xslt="${xsl}"/>

  </x:if>

</c:if>

