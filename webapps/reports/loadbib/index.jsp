<%@ page language="java" contentType="text/html" %>

<%@ taglib uri="http://jakarta.apache.org/taglibs/xtags-1.0" prefix="xt" %>

<%-- Beans --%>

<jsp:useBean class="edu.umd.lims.aleph.loadbib.report.Report" id="lrep"
             scope="session"/>
<jsp:setProperty name="lrep" property="lib"      value=""/>
<jsp:setProperty name="lrep" property="loader"   value=""/>
<jsp:setProperty name="lrep" property="report"   value=""/>
<jsp:setProperty name="lrep" property="format"   value=""/>
<jsp:setProperty name="lrep" property="campus"   value=""/>
<jsp:setProperty name="lrep" property="category" value=""/>

<%-- Page --%>

<%@ include file="header.jsp" %>

Available Loaders

<xt:style xsl="loaders-active.xsl" xml="loaders.xml"/>

<br/>
No longer used:

<xt:style xsl="loaders-obsolete.xsl" xml="loaders.xml"/>

<%@ include file="footer.jsp" %>

