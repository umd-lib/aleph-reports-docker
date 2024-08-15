
<%-- Build the navigation menu --%>

<%
  String strNav = "&nbsp; <a href=\"/reports/loadbib\" title=\"loadbib\" class=\"menu\">loader</a>";

  String strNavParm = request.getParameter("nav");
  if (strNavParm != null) {
    strNav += strNavParm;
  }
%>

<jsp:include page="../header.jsp">
  <jsp:param name="nav" value="<%= strNav %>"/>
</jsp:include>

