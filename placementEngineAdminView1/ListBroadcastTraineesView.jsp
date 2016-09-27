<%@page import="java.util.ListIterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ts.demand.pojo.TraineeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src = https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css> </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
    table {
    width:100%;
    }
    
     
    #sort {
    	color: grey;
    }
    </style>
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
</head>
<body>
<div id="header">
    <h1><a href="home.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt="talentsprint" style="width:6%; float="left">
    </a></h1>
</div>
<div id="nav">
<b>Menu</b><br>

<ul>
<li class = "a"><a href= "ListTraineeView.jsp"><h4>Trainee Details</h4></a></li>
<li class = "a"><a href= "partnerView.jsp"><h4>Partner</h4></a></li>
<li class = "a"><a href= "DemandView.jsp"><h4>Demand</h4></a></li>
<li class = "a"><a href= "DriveView.jsp"><h4>Drive</h4></a></li>
<li class = "a"><a href = "#"><h4>Report</h4></a></li>
<li class = "p"><a href= "TraineeHistory.jsp"><h5>Trainee History</h5></a></li>
<li class = "p"><a href= "ListOfDrivesView.jsp"><h5>Drives By Company</h5></a></li>
<li class = "p"><a href= "#"><h5>Selected Trainee</h5></a></li>
<li class = "p"><a href= "inactiveTraineeView.jsp"><h5>Inactive Trainee</h5></a></li>
</ul>
</div>
<div id="section">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<center>
<br><br>
<h1 align ="center"><font color="Orange">BROADCAST LIST</font></h1><br>
</head>

    <%
    try {
    ArrayList<TraineeBean> etrainees = (ArrayList<TraineeBean>)request.getAttribute("etrainees");
    ListIterator<TraineeBean> lt = etrainees.listIterator();
    %>
    <table id = "example" class="table">
        <thead>
            <tr>
            <th>Name <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
            <th>TraineeId <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
            <th>Email <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
            <th>Status <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
            </tr>
        </thead>
        <%
        while(lt.hasNext()) {
        	TraineeBean tb = lt.next();
        	out.print("<tr>");
        	out.print("<td>" + tb.getName() + "</td>");
        	out.print("<td>" + tb.getTraineeid() +"</td>");
        	out.print("<td>" + tb.getEmail()+"</td>");
        	out.print("<td> Active </td>");
        	out.println("<td><a href=Update.jsp?name="+tb.getName()+"&batch="+tb.getBatch()+"&traineeid="+tb.getTraineeid()+"&gender="+tb.getGender()+"&email="+tb.getEmail()+"&dob="+tb.getDob()+"&mobile="+tb.getMobile()+"&cname="+tb.getCname()+"&clocation="+tb.getClocation()+"&lgrad="+tb.getLgrad()+"&ygrad="+tb.getYgrad()+"&yinter="+tb.getYinter()+"&yssc="+tb.getYssc()+"&markspg="+tb.getMarkspg()+"&marksug="+tb.getMarksug()+"&marks12="+tb.getMarks12()+"&marks10="+tb.getMarks10()+"&skill="+tb.getSkill()+"&certification="+tb.getCertification()+"&comgrade="+tb.getComgrade()+"&tgrade="+tb.getTgrade()+"&pgrade="+tb.getPgrade()+"&agrade="+tb.getAgrade()+"&active="+tb.isActive()+"&reason="+tb.getReason()+"&vfrom="+tb.getVfrom()+"&vto="+tb.getVto()+"&verify="+tb.getVerify()+" class='btn btn-success'> Show more details <span class='glyphicon glyphicon-pencil'></a></td>");
        	}
    }
    catch(Exception e) {
    	
    }
        %>        
    </table>
    <a href="DemandView.jsp">Show Demands</a>
    <br><br>
    <a href ="acessedTrainee.jsp" >Show Accessed Trainee</a>
    <div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>

</body>
</html>