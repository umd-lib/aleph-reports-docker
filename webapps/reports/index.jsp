<%@ page language="java" contentType="text/html" %>

<%-- Bean Declarations --%>

<%-- Page --%>

<%@ include file="header.jsp"%>

<a href="loadbib">Bibliographic Loader</a>

<br></br>
<a href="generic?report=xpt&beanName=edu.umd.lims.aleph.ReportXpt&lib=mai01">XPT</a>

<br></br>
<a href="generic?report=edi&lib=mai50">EDI</a>

<br></br>
<a href="generic?report=marcivefull-nohol&campus=all&lib=mai01">Marcive Full records with
no Hol or Item</a>

<br></br>
<a href="generic?report=callnums&lib=mai50">Call Number Ranges</a>

<br></br>
<a href="generic?report=scmi&lib=mai50">Sublibrary/Collection/Material/Item Status Combinations</a>

<br></br>
<a href="generic?report=sicm&lib=mai50">Sublibrary/Item Status/Collection/Material Combinations</a>

<br></br>
<a href="generic?report=loanrep&lib=mai50">Circulation counts by institution</a>

<br></br>
<a href="generic?report=auth_reload&lib=mai01">Authority Reload (Bib
Cleanup)</a>

<br></br>

<a href="generic?report=loadauth">Authority Loader</a>

<br></br>
<a href="circstats">Circulation Statistics</a>

<br></br>
<a href="generic?report=pacstats&lib=mai01">OPAC Statistics</a>

<%@ include file="footer.jsp"%>

