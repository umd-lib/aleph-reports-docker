<% 
  String strNav = request.getParameter("nav");
  if (strNav == null) {
    strNav = "";
  }
%>

<html>
  <head>
    <title>USMAI Reports</title>

    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache"> 
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
    <META HTTP-EQUIV="Expires" CONTENT="Sun, 06 Nov 1994 08:49:37 GMT"> 

    <link rel="stylesheet" href="/reports/aleph.css" TYPE="text/css">
  </head>

  <body bgcolor="white" topmargin="0" marginheight="0">

  <table width="100%" border="0" cellspacing="0" cellpadding="0">

     <tr><td><br></td></tr>

     <tr><td> 
        <font size="+1" color="red"><b>USMAI Reports</b></font>
     </td></tr>

     <tr class="tr2" valign="middle">
     	  <td colspan="3" nowrap>
     		  <img src="/reports/images/black.gif" width="100%" height="1" 
     				 border="0" alt=" "><br>
     		  &nbsp;
     		  <a href="/reports" title="home" class="menu" id="bold">
     			  HOME
     		  </a>
           <%= strNav %>
     		  <br>
     	     <img src="/reports/images/black.gif" width="100%" height="1"
     			    border="0" alt=" "></td>  
     </tr> 

     <tr><td>&nbsp;</td></tr>

     <tr><td>
       <div align="center">
       <table width="95%" border="0" cellspacing="0" cellpadding="0">
       <tr><td>
