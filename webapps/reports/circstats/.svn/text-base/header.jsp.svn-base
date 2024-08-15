
<%-- Build the navigation menu --%>

<%
  String strNav = "&nbsp; <a href=\"/reports/circstats\" title=\"circstats\" class=\"menu\">circstats</a>";

  String strNavParm = request.getParameter("nav");
  if (strNavParm != null) {
    strNav += strNavParm;
  }
%>

<jsp:include page="../header.jsp">
  <jsp:param name="nav" value="<%= strNav %>"/>
</jsp:include>

