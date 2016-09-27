<%@page import="com.ts.demand.partner.dao.Demand"%>
<%@page import="com.ts.demand.partner.dao.Drive"%>
<%@page import="com.ts.demand.partner.dao.DriveDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>


<%
DriveDAO dDAO = new DriveDAO();
ArrayList<com.ts.demand.partner.dao.Drive> ald = dDAO.getAllDrives();
Iterator<com.ts.demand.partner.dao.Drive> itr = ald.iterator();
ArrayList<Demand> aldd = dDAO.listAllDemands();
Iterator<Demand> itr2 = aldd.iterator();

%>

<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src = https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css> </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src = "https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
   <script>


$(document).ready(function() {
    $('#example').DataTable( {
        columnDefs: [ {
            targets: [ 0 ],
            orderData: [ 0, 1 ]
        }, {
            targets: [ 1],
            orderData: [ 1, 0 ]
        }, {
            targets: [ 1],
            orderData: [ 1, 0 ]
        } ]
    } );
} );
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
<link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>
<jsp:include page = "layout.jsp"></jsp:include>




<br><br>
<h1 align ="center"><font color="Orange">DRIVE LIST</font></h1><br>
<center>
<a href="ListDemand.jsp" class="btn btn-success" role="button">Create New Drive </a>
</center>
<br>
<table class = "table" id = "drives">
<thead>
<tr>
<th>Drive</th>
<th>Rounds</th>
</tr>
</thead>
<%
while(itr.hasNext()){
Drive d = (Drive)itr.next();
%>
<tr>
<td><%=d.name%>
<br></td>
<td><form action = "round.jsp">
<!-- <input type = "submit" class = "btn btn-success" value = "Rounds">
 -->
<button class = "btn btn-success">Process <span class = "glyphicon glyphicon-chevron-right"></span></button>
<input type = "hidden" name = "drivename" value = <%=d.name%>>
</form></td>
<%
}
%>
</tr>
</table>
</div>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>

</body>
</html>