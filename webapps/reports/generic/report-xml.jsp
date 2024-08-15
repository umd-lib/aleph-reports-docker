<%@ page language="java" contentType="text/xml; charset=UTF-8" %>

<%@ page import="edu.umd.lims.aleph.*" %>
<%@ page import="org.apache.xalan.xslt.*" %>


<%-- Beans --%>

<jsp:useBean class="edu.umd.lims.aleph.Report"
             id="srep" scope="session"/>

<jsp:useBean beanName="<%= srep.getBeanName() %>" 
             type="edu.umd.lims.aleph.Report"
             id="rep" scope="session"/>
<jsp:setProperty name="rep" property="*"/>


<%-- Page --%>

<% 
  out.clear();  // Clear the JSP skipped lines so the xml header
                // comes at the beginning of the file.
  rep.writeXml(out); 
%>
