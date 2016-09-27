<%@page import="com.ts.demand.pojo.*"%>
<%@page import="com.ts.demand.partner.dao.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ts.demand.partner.dao.DriveDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!--  <script src = https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css> </script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   <script src = "https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script> -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
     <link rel="stylesheet" type="text/css" href="style.css">
 <script>

 $(document).ready(function(){
	    $("#hides").hide();
	    $("#shows").click(function(){
	        $("#hides").show();
	    });
 });</script>
 <script>
 function other(){ 
	 document.getElementById("myForm").submit();
 }
 </script> 
<style>
  .dropdown-menu{
      background-color:grey;
   }
  
</style>

</head>


<body>
<jsp:include page = "layout.jsp"></jsp:include>
<br><br>
<h1 align ="center"><font color="Orange">ROUND LIST</font></h1><br>
 <%
 
String driveid = request.getParameter("driveid");
DriveRoundsPojo r = new DriveRoundsPojo();
String drivename = request.getParameter("drivename");
System.out.println(drivename);
DriveDAO dDAO = new DriveDAO();
ArrayList<DriveRoundsPojo> ald = dDAO.getAllRounds(drivename);
Iterator<DriveRoundsPojo> itr = ald.iterator();
%>

<h4> <%=drivename%></h4>
<h3>Rounds</h3>
 <table id = "example" class="table">

<% 
while(itr.hasNext()){
	 r = itr.next();
%>
<tr>
<td><%=r.getRounds()%></td>
<td><a class = "btn btn-success" href = "scheduleView.jsp?driveid=<%=r.getDrive_id()%>&roundid=<%=r.getRound_num() %>">Schedule</a></td>
<%
}
System.out.println(r.getDrive_id()+"round.jsp");
%>
</tr>
</table>
<div class="dropdown">
    <button class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown">Add Round
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
  	<li><a href="addround?round=GroupDiscussion&pop=a&drivename=<%=drivename%>">GROUP DISCUSSION</a></li>
	<li><a href="addround?round=HRInterview&pop=a&drivename=<%=drivename%>">HR INTERVIEW</a></li>
	<li><a href="addround?round=InternalCommunicationEvaluation&pop=a&drivename=<%=drivename%>">INTERNAL COMMUNICATION EVALUATION</a></li>
	<li><a href="addround?round=InternalWrittenTest&pop=a&drivename=<%=drivename%>">INTERNAL WRITTEN TEST</a></li>
	<li><a href="addround?round=Interview&pop=a&drivename=<%=drivename%>">INTERVIEW</a></li>
	<li><a href="addround?round=TechnicalInterviewpop=a&&drivename=<%=drivename%>">TECHNICAL INTERVIEW</a></li>
	<li><a href="addround?round=WrittenTest&pop=a&drivename=<%=drivename%>">WRITTEN TEST</a></li>
	<li><a id = "shows">OTHER</a></li>
  </ul>
	<form id="myForm" action = "addround" method = "post">
	<input type = "hidden" id = "drive" name = "drivename" value = <%=drivename%>>
	<input type = "hidden" name = "pop" value = "a">
	<input type = "text" id = "hides" name = "round" onchange = "other();">
	</form>
</div>
<br><br></br>

<%
ScheduleDAO sDAO = new ScheduleDAO();
ArrayList<TraineeBean> ald1 = sDAO.displaySceduledTrainee(r.getDrive_id(),r.getRound_num());
Iterator<TraineeBean> itr1 = ald1.iterator();
if(itr1.hasNext()){%>
<div class = "table" align = "center">
	<table id = "example" class="table">
	<tr><th>TraineeId </th>
	<th>Name</th>
	<th>Mobile</th>
	<th>Batch</th></tr><%} %>
<% 
while(itr1.hasNext()){
	TraineeBean tb = (TraineeBean)itr1.next();
	out.print("<tr>");
	out.print("<td>" + tb.getTraineeid() + "</td>");
	out.print("<td>" + tb.getName() +"</td>");
	out.print("<td>" + tb.getMobile() +"</td>");
	out.print("<td>" + tb.getBatch()+"</td>");
	out.print("</tr>");
}
%></table></div>
<script>
function confirm(){
	if(confirm("Are you sure to add ?")){
	}
	else{
		return false;
	}
}</script>
</div>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>
</html>