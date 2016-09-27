<%@page import="com.ts.demand.partner.dao.ReportDAO"%>

<%@page import="com.ts.demand.pojo.*"%>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.ArrayList"%>

<%@page import="com.ts.demand.partner.dao.PartnerDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">

       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

   

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

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

            targets: [ 4 ],

            orderData: [ 4, 0 ]

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

//long partner_id = Long.parseLong(request.getParameter("Id"));







 /* out.print(partner_id);  */

 ReportDAO pdao = new ReportDAO();




/* int partner_id = Integer.parseInt(request.getParameter("partner_id")); */

ArrayList<ListDrivePojo> alcdis = pdao.getAllDistinctContacts();

 Iterator<ListDrivePojo> itr1 = alcdis.iterator();

 ArrayList<ContactPojo> alc = pdao.getAllContact();

 ListDrivePojo cb;

 Iterator<ContactPojo> itr = alc.iterator();




  




%>




<div id = "section" >

<h1 align ="center"><font color="orange">CONTACT LIST</font></h1>




<div class = "table" align = "center">

<table id = "keywords" class = "table">

<a href="DownloadContacts" class="btn btn-success" style="position:absolute;left:700px;top:170px;">Download All<span class="glyphicon glyphicon-download-alt"></span></a>&nbsp;&nbsp;&nbsp;

<br></br><div class="dropdown">

  <button  class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown" style = "position:absolute;left:617px;top:-25px;">Download<span class="glyphicon glyphicon-download-alt">

  </span></button>

  <ul class="dropdown-menu" style = "position:absolute;left:617px;top:7px;">

     <% while(itr1.hasNext()) {

    	   

                 cb = itr1.next();

 %>

   <li><a href="DownloadContact?partner=<%= cb.getPartner()%>"><%= cb.getPartner()%></a></li><%} %>

   </ul>

</div>

<br></br>




<thead> 

<tr>

                 




				<td><b>Name</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				<td><b>Title</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				<td><b>Email</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				<td><b>Phone</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				<td><b>City</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				

</tr>

</thead>










<% while(itr.hasNext()) {




               ContactPojo cba = itr.next(); %>




                <tr>




                

                <td><%=cba.getName()%></td>




                <td><%=cba.getTitle()%></td>




                <td><%=cba.getEmail()%></td>




                <td><%=cba.getPhone()%></td>




                <td><%=cba.getCity()%></td>

               </tr>




   <%} %></table>




</div>

</div>










<div id = "footer">

<jsp:include page = "UIFooter.jsp"></jsp:include></div>

</body>

</html>