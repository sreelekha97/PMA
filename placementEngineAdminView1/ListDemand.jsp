<%@page import="com.ts.demand.partner.dao.DriveDAO"%>
<%@page import="com.ts.demand.partner.dao.Demand"%>
<%@page import="com.ts.demand.partner.dao.Drive"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
DriveDAO dDAO = new DriveDAO();
ArrayList<Drive> ald = dDAO.getAllDrives();
Iterator<Drive> itr = ald.iterator();
ArrayList<Demand> aldd = dDAO.listAllDemands();
Iterator<Demand> itr2 = aldd.iterator();
%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src = https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css> </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src = "https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
   
<script>
$(document).ready(function(){
    $(".b ,.c,.p,.e").hide();
   $(".a").click(function(){
       $(".p").toggle();
   });
   $(".d").click(function(){
       $(".b,.e").toggle();
       $(".c").hide();
       $(".e").click(function(){
          $(".c").toggle();
   }); });
});
</script>
</head>
<body>
<jsp:include page = "layout.jsp"></jsp:include>
<!-- <div id="header"> -->
<!--     <h1><a href="home.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt="talentsprint" style="width:6%; float="left"> -->
<!--     </a></h1> -->
<!-- </div> -->

    <div id="section">
<br><br>
<h1 align ="center"><font color="Orange">ADD DRIVE</font></h1><br>

<title>Drive table</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

 <table class="table table-hover"><thead>
 <th>DemandName <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
<th>PartnerName <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
<th>Date <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
</thead>
<%
while(itr2.hasNext()){
Demand d = (Demand)itr2.next();
%>
<tr>
<td><%=d.ref_id%></td></li>
<td><%=d.Name%></td>
<td><%=d.created%></td>
<td><form action = "addDrive.jsp">
<button class = "btn btn-success">Process<span class = "glyphicon glyphicon-chevron-right"></button>
<input type = "hidden" name = "demand" value = <%=d.ref_id%>>
</form></td></tr>
<%} %>


</table>
</div>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>
</html>