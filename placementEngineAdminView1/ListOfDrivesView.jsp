<%@page import = "com.ts.demand.pojo.*"%>
<%@page import = "java.util.Iterator" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.ts.demand.partner.dao.*"%>

<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
   
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src = https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css> </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src = "https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    
     <link rel="stylesheet" type="text/css" href="style.css">
    <style>
    #hide{
    width:150px;
    height:30px;

}
    img{
        margin:0px;
        align:left;
        float:left;
        height: auto;
    }
    a:link {
        text-decoration: none;
        text-color:white;
        
     
    }
    a:visited {
        text-decoration: none;
        
    }
    a:hover {
        text-decoration: underline;
        color:#111;
    }
    a:active {
        text-decoration: none;
    }
    .name-link, .name-link:hover {
        color: inherit;
        text-decoration:none;
    }
    #sort {
    	color: grey;
    }
    
    table {
    width:100%;
    }
    </style>
<script>
  $(document).ready(function() {
	
	    $('#keywords').DataTable( {
	        columnDefs: [ {
	            targets: [ 0 ],
	            orderData: [ 0, 1 ]
	        }, {
	            targets: [ 1],
	            orderData: [ 1, 0 ]
	        }, {
	            targets: [ 0],
	            orderData: [ 0, 0 ]
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


</head>
<body>


<div id="header">
<h1><a href = "UIHome.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt = "talentsprint" style="width:6%; float = "left" ></a></h1>
</div>
<div id="nav">
<b>Menu</b><br>
<ul>
<li class = "a"><a href= "ListTraineeView.jsp"><h4>TraineeDetails</h4></a></li>
<li class = "a"><a href= "partnerView.jsp"><h4>Partner</h4></a></li>
<li class = "a"><a href= "DemandView.jsp"><h4>Demand</h4></a></li>
<li class = "a"><a href= "DriveView.jsp"><h4>Drive</h4></a></li>
<li class = "a"><h4>Report</h4></li>
<li class = "p"><a href= "TraineeHistory.jsp"><h5>TraineeHistory</h5></a></li>
<li class = "p"><a href= "ListOfDrivesView.jsp"><h5>DrivesByCompany</h5></a></li>
<li class = "p"><a href= "#"><h5>SelectedTrainee</h5></a></li>
<li class = "p"><a href= "inactiveTraineeView.jsp"><h5>InactiveTrainee</h5></a></li>
</ul>
</div>

<%
 ReportDAO pdao = new ReportDAO();
 ArrayList<ListDrivePojo> alc = pdao.getAllDrives();
 ArrayList<ListDrivePojo> alcdis = pdao.getAllDistinctDrives();
 Iterator<ListDrivePojo> itr = alc.iterator();
 ListDrivePojo cb;
 Iterator<ListDrivePojo> itr1 = alcdis.iterator();
 
%>
<div id = "section">
<br><br>
<h1 align ="center"><font color="Orange">COMPANY - DRIVE</font></h1><br> 

<div class = "table" align = "center">
<table id = "keywords" class ="table">
<a href="DownloadDrives" class="btn btn-success" style="position:absolute;left:700px;top:200px;">Download All<span class="glyphicon glyphicon-download-alt"></span></a>&nbsp;&nbsp;&nbsp;
<div class="dropdown">
  <button  class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown" style = "position:absolute;left:617px;top:-25px;">Download<span class="glyphicon glyphicon-download-alt">
  </span></button>
  <ul class="dropdown-menu" style = "position:absolute;left:617px;top:7px;">
    <% while(itr1.hasNext()) {
    	   
                 cb = itr1.next();
 %>
   <li><a href="DownloadDrive?partner=<%= cb.getPartner()%>"><%= cb.getPartner()%></a></li><%} %>
  </ul>
</div>
<br></br>


<thead>
<tr>
                <td><b>Company <span id = "sort" class = "glyphicon glyphicon-sort"></span></b></td>
                <td><b>Drive <span id = "sort" class = "glyphicon glyphicon-sort"></span></b></td> 
</tr>
</thead>
 <% while(itr.hasNext()) {
                 cb = itr.next();
                out.print("<tr>");
                out.print("<td>" + cb.getPartner());
                out.print("<td>" + cb.getRef_id());
                out.print("</tr>");
   }

%>
</table>
</div>

</div>



<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>
</html>