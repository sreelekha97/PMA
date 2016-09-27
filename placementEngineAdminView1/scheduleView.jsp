
<%@page import="java.util.Iterator"%>
<%@page import="com.ts.demand.partner.dao.ScheduleDAO"%>
<%@page import="com.ts.demand.pojo.TraineeBean"%>
<%@page import="com.ts.demand.partner.dao.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
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
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
    
    <style>
  
    .container{
    
	margin-left:200px;   
	margin-top:100px;    
    }
    img{
        margin:0px;
        align:left;
        float:left;
        height: auto;
    }
    a:link {
        text-decoration: none;
        color:black;
    }
    a:visited {
        text-decoration: none;
        color:black;
    }
    a:hover {
        text-decoration: underline;
        color:#00004d;
    }
    a:active {
        text-decoration: none;
    }
    .name-link, .name-link:hover {
        color: inherit;
        text-decoration:none;
    }
    }
    </style>
	<script>
$(document).ready(function(){
    $('.check:button').toggle(function(){
        $('input:checkbox').attr('checked','checked');
        $(this).val('uncheck all')
    },function(){
        $('input:checkbox').removeAttr('checked');
        $(this).val('check all');        
    })
})
</script>
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
    $(document).ready(function() {
    $('#keywords').DataTable( {
        columnDefs: [ {
            targets: [ 0 ],
            orderData: [ 0, 1 ]
        }, {
            targets: [ 1 ],
            orderData: [ 1, 0 ]
        }, {
            targets: [ 8 ],
            orderData: [ 8, 0 ]
        }]
    });
    });
</script>
  <script>
    
</script>
 
</head>
<body>
<jsp:include page = "layout.jsp"></jsp:include>
<%
String error = request.getParameter("error");
String driveid = request.getParameter("driveid");
System.out.println(driveid +"schedulejsp");
String drivename = request.getParameter("drivename");
String  roundid = request.getParameter("roundid");
System.out.println(driveid+"123456789013456789");
System.out.println(roundid);
%>
<%
if(error != null){
	out.println("<script type = \"text/javascript\">");
    out.println("alert('please select any one trainee');");
    out.println("location='scheduleView.jsp?driveid="+driveid+"&roundid="+roundid+"';");
    out.println("</script>");
}

%>

<div class = "container" >
<div class="panel-group col-lg-30 col-md-40 col-sm-8" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h1 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" >View Schedule Trainee <span class= "glyphicon glyphicon-menu-down"></a>
        </h1>
      </div>
	<div id="collapse1" class="panel-collapse collapse in">
	
    <div class="panel-body">
  <form action = "updatestatus" method = "post">  
<input type="button" class="check" value="check all" />
    
    <select name = "status" style = "margin-left:500px">
    <option value = "No_show">No_Show</option>
   	<option value = "Rejected">Rejected</option> 
  	<option value = "Cleared">Cleared</option>
    <option value = "Attended">Attended</option>
    <option value = "Offered">Offered</option>
    <option value = "CannnotAttended">CannotAttended</option>
    </select>&nbsp;&nbsp;&nbsp;<input type = "submit" value = "save"><br></br>
    <div class = "table" align = "center">
<table id = "example" class="table">
<tr>
<th></th>
<th>TraineeId <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
<th>Name <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
<th>Mobile <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
<th>Status <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
<th>Batch <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
</tr>
    
    <%
 ScheduleDAO dDAO = new ScheduleDAO();
try{
ArrayList<TraineeBean> ald = dDAO.scheduleTrainee(driveid,roundid,1);
Iterator<TraineeBean> itr = ald.iterator();
while(itr.hasNext()){
TraineeBean tb = (TraineeBean)itr.next();
out.print("<tr>");
%>
<td style = 'padding-top:20px;'><input type = "checkbox" name = "check" value = <%=tb.getTraineeid()%>></td>
<input type = "hidden" name = "roundid" value = <%=roundid%>>
<input type = "hidden" name = "driveid" value = <%=driveid%>>
<input type = "hidden" name = "drivename" value = <%=drivename%>>
<input type = "hidden" name = "single" value = "3">
<%
	out.print("<td style = 'padding-top:35px;'>" + tb.getTraineeid() + "</td>");
	out.print("<td style = 'padding-top:35px;'>" + tb.getName() +"</td>");
	out.print("<td style = 'padding-top:35px;'>" + tb.getMobile() +"</td>");
	out.print("<td style = 'padding-top:35px;'>" + tb.getReason()+"</td>");
	out.print("<td style = 'padding-top:35px;'>" + tb.getBatch()+"</td>");
	%>
	<td>
	<a href = "updatestatus?status=Attended&single=0&traineeid=<%=tb.getTraineeid()%>&roundid=<%=roundid%>&driveid=<%=driveid%>">Attended</a><br>
	<a href = "updatestatus?status=Cleared&single=0&traineeid=<%=tb.getTraineeid()%>&roundid=<%=roundid%>&driveid=<%=driveid%>">Cleared</a><br>
	<a href = "updatestatus?status=Rejected&single=0&traineeid=<%=tb.getTraineeid()%>&roundid=<%=roundid%>&driveid=<%=driveid%>">Rejected</a><br>
	<a href = "updatestatus?status=CannotAttended&single=0&traineeid=<%=tb.getTraineeid()%>&roundid=<%=roundid%>&driveid=<%=driveid%>">CannotAttend</a><br>
	<a href = "updatestatus?status=No_show&single=0&traineeid=<%=tb.getTraineeid()%>&roundid=<%=roundid%>&driveid=<%=driveid%>">No_Show</a><br>
	<a href = "updatestatus?status=Offered&single=0&traineeid=<%=tb.getTraineeid()%>&roundid=<%=roundid%>&driveid=<%=driveid%>">Offered</a></td>
	</td>
<% 
out.print("</tr>");
}
}catch(NumberFormatException e){
	System.out.println(e);
}
%></div>
</table>
    
	 </div>
 </div>
 </div></div></form><br>
<br/>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h1 class="panel-title">
        <br><br><br>
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2" >ScheduleTrainee <span class= "glyphicon glyphicon-menu-down"></a>
        </h1>
      </div>
	<div id="collapse2" class="panel-collapse collapse out">
    <div class="panel-body">
    
<form method="post" action="selecttrainee">
<label ><h4>Date</h4></label> </td>
<input  id="date" type="date" name="date" required autofocus><br> 

<label ><h4>Time</h4></label>
<input  id="time" type="time" name="time"  required> <br>

<input type="button" class="check" value="check all" />
 <br>

<div class = "table" align = "center">
<table id = "example" class="table">

<tr>
<th></th>
<th>TraineeId <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
<th>Name <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
<th>Mobile <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
<th>Batch <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>

</tr>

<%
try{
ArrayList<TraineeBean> ald = dDAO.scheduleTrainee(driveid,roundid,0);
Iterator<TraineeBean> itr = ald.iterator();
while(itr.hasNext()){
TraineeBean tb = (TraineeBean)itr.next();
out.print("<tr>");
%>
<td><input type = "checkbox" name = "check" value = <%=tb.getTraineeid()%>></td>

<input type = "hidden" name = "roundid" value = <%=roundid%>>
<input type = "hidden" name = "driveid" value = <%=driveid%>>
<input type = "hidden" name = "drivename" value = <%=drivename%>>
<%
	out.print("<td>" + tb.getTraineeid() + "</td>");
	out.print("<td>" + tb.getName() +"</td>");
	out.print("<td>" + tb.getMobile() +"</td>");
	out.print("<td>" + tb.getBatch()+"</td>");
	out.print("</tr>");
}
}catch(NumberFormatException e){
	System.out.println(e);
}

%></div>
</table>
<h3 align="center"><button type="submit" name="add" class="btn btn-success">Schedule <span class="glyphicon glyphicon-plus"></button></h3>

</form>
</div>
	
	 </div>
 </div>
 </div>


</div>
</div>  
</div></body>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>

</html>