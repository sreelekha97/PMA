<%@page import = "com.ts.demand.pojo.*"%>
<%@page import = "java.util.Iterator" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.ts.demand.partner.dao.ReportDAO"%>

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
    <style>
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
     #sort {
    	color: grey;
    }
    
    table {
    width:100%;
    }
    </style>
   
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
            targets: [ 2],
            orderData: [ 2, 0 ]
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
<li class = "p"><a href= "ListTraineeView.jsp"><h4>TraineeDetails</h4></a></li>
<li class = "p"><a href= "partnerView.jsp"><h4>Partner</h4></a></li>
<li class = "p"><a href= "DemandView.jsp"><h4>Demand</h4></a></li>
<li class = "p"><a href= "DriveView.jsp"><h4>Drive</h4></a></li>
<li class = "e"><h4>Report</h4></li>
<li class = "c"><a href= "TraineeHistory.jsp"><h5>TraineeHistory</h5></a></li>
<li class = "c"><a href= "ListOfDrivesView.jsp"><h5>DrivesByCompany</h5></a></li>
<li class = "c"><a href= "#"><h5>SelectedTrainee</h5></a></li>
<li class = "c"><a href= "inactiveTraineeView.jsp"><h5>InactiveTrainee</h5></a></li>
</ul>
</div>
<div id = "section" align = "center">
<br><br>
<h1 align ="center"><font color="Orange">SELECTED TRAINEE</font></h1><br>
<%
 ReportDAO pdao = new ReportDAO();
 ArrayList<SelectedTrainee> alc = pdao.getSelectedTrainee();
 Iterator<SelectedTrainee> itr = alc.iterator();
%>
<div class = "table" >
<table id = "example" class ="table"><br></br>
<a href = "DownloadSelectedTrainee" class="btn btn-success" style="margin-right: 7px;">Download<span class="glyphicon glyphicon-download-alt"></span></a>
<br></br>
<thead>
<tr>
                
                
                <td><b>Trainee Id</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>
                <td><b>Name</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>
                <td><b>Status</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>
                <td><b>Drive</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>
               
</tr>
</thead>
 <% while(itr.hasNext()) {
                SelectedTrainee cb = itr.next();
                out.print("<tr>");
                out.print("<td>" + cb.getTraineeId());
                out.print("<td>" + cb.getName());
                out.print("<td>" + cb.getstatus());
                out.print("<td>" + cb.getdrive());
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