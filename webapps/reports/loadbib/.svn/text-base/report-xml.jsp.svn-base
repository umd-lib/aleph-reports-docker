<%----------------------------------------------------------------------%>

<%@ page language="java" contentType="text/xml; charset=UTF-8" %>

<%@ page import="edu.umd.lims.aleph.*" %>
<%@ page import="org.apache.xalan.xslt.*" %>


<%----------------------------------------------------------------------%>

<jsp:useBean class="edu.umd.lims.aleph.loadbib.report.Report" id="lrep"
             scope="session"/>
<jsp:setProperty name="lrep" property="*"/>


<%----------------------------------------------------------------------%>

<% 
  out.clear();  // Clear the JSP skipped lines so the xml header
                // comes at the beginning of the file.
  lrep.writeXml(out); 
%>
