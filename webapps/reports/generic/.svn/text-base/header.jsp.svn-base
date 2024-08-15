
<%-- Beans --%>

<jsp:useBean class="edu.umd.lims.aleph.Report"
             id="srep" scope="session"/>

<jsp:useBean beanName="<%= srep.getBeanName() %>" 
             type="edu.umd.lims.aleph.Report"
             id="rep" scope="session"/>

<%-- Page --%>

<%
  String strHref = "/reports/generic?" +
                   "report=" + rep.getReport() +
                   (rep.getCampus() == null ? "" : "&campus=" + rep.getCampus());
  String strNav = "&nbsp; <a href=\"" + strHref + "\" class=\"menu\">" + rep.getReport() + "</a>";

  String strNavParm = request.getParameter("nav");
  if (strNavParm != null) {
    strNav += strNavParm;
  }
%>

<jsp:include page="../header.jsp">
  <jsp:param name="nav" value="<%= strNav %>"/>
</jsp:include>

<br>

<%-- Debugging --%>
<%--
beanName = <jsp:getProperty name="srep" property="beanName"/><br>
report = <jsp:getProperty name="rep" property="report"/><br>
lib    = <jsp:getProperty name="rep" property="lib"   /><br>
file   = <jsp:getProperty name="rep" property="file"  /><br>
format = <jsp:getProperty name="rep" property="format"/><br>

<br>
<br>
--%>


