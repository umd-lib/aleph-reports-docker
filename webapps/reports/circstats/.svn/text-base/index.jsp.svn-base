<%@ page language="java" contentType="text/html" %>

<%@ taglib uri="http://jakarta.apache.org/taglibs/xtags-1.0" prefix="xt" %>

<%-- Beans --%>

<jsp:useBean class="edu.umd.lims.aleph.circstats.report.Report" id="crep"
             scope="session"/>
<jsp:setProperty name="crep" property="lib"      value=""/>
<jsp:setProperty name="crep" property="loader"   value=""/>
<jsp:setProperty name="crep" property="report"   value=""/>
<jsp:setProperty name="crep" property="format"   value=""/>
<jsp:setProperty name="crep" property="campus"   value=""/>
<jsp:setProperty name="crep" property="category" value=""/>

<%-- Page --%>

<%@ include file="header.jsp" %>

Institutions

<xt:style xsl="campus.xsl" xml="campus.xml"/>

<%@ include file="footer.jsp" %>

