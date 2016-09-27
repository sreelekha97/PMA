<%@page import="com.ts.demand.pojo.TraineeBean"%>
<%@page import="com.ts.demand.pojo.DemandPojo"%>
<%@page import="com.ts.demand.partner.dao.DriveDAO"%>
<%@page import="com.ts.demand.partner.dao.Demand"%>
<%@page import="com.ts.demand.partner.dao.Drive"%>
<%@page import="com.ts.demand.partner.dao.Drive"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
   <link rel="stylesheet" type="text/css" href="style.css">
   
</head>
<body>
<div id="header">
<h1><a href = "UIHome.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt = "talentsprint" style="width:6%; float = "left" ></a></h1>
</div>
<div id="nav">
<b>Menu</b><br>
<ul>
<li class = "a"><a href= "ListTraineeView.jsp"><h4>Trainee Details</h4></a></li>
<li class = "a"><a href= "partnerView.jsp"><h4>Partner</h4></a></li>
<li class = "a"><a href= "DemandView.jsp"><h4>Demand</h4></a></li>
<li class = "a"><a href= "DriveView.jsp"><h4>Drive</h4></a></li>
<li class = "a"><h4>Report</h4></li>
<li class  = "p"><a href= "TraineeHistory.jsp"><h5>Trainee History</h5></a></li>
<li class  = "p"><a href= "ListOfDrivesView.jsp"><h5>Drives By Company</h5></a></li>
<li class  = "p"><a href= "SelectedTrainee.jsp"><h5>Selected Trainee</h5></a></li>
<li class  = "p"><a href= "inactiveTraineeView.jsp"><h5>Inactive Trainee</h5></a></li>
</ul>
</div>
<div id = "section">
<div class = "table" align = "center">
<table id = "example" class="table">
<br><br><br>
    <%
        DemandPojo dempojo = (DemandPojo)request.getAttribute("demand");
        TraineeBean tbean = (TraineeBean)request.getAttribute("trainee");  
        String edate = (String)request.getAttribute("expDate");
        boolean eligible = false;
        if((tbean.getMarks10() >= dempojo.getMarks10())
            &&(tbean.getMarks12() >= dempojo.getMarks12())
            &&(tbean.getMarksug() >= dempojo.getMarksUG())
            &&(tbean.getCertification().equals(dempojo.getCertification()) || dempojo.getCertification().equals("Not Applicable"))
            &&((tbean.getGender().equals(dempojo.getGender())) || (dempojo.getGender().equals("Any")))
            &&(tbean.getYgrad() >= dempojo.getLastGradYear())
            &&(dempojo.getDegrees().contains(tbean.getLgrad()))
            &&((tbean.getLgrad().substring(0, 1).equals("B")) || (tbean.getMarkspg() >= dempojo.getMarksPG()))) {
               	eligible = true;
            } else {

            }
               
    %>
    <div class="container">
        
        <p><% if(eligible == true) {%>
            Congratulations! You are eligible for this opening.
           <%} else { %>
           Sorry, you are not eligible for this opening. However, if you are eligible under "Special Conditions" mentioned above,
           please contact Placement Support.<br>
           If you have any concerns then you can contact Placement Support.<br>
           Thank You<br> 
           <%} %>
             </p>
    </div>
    <table>
    <tr>
        <td> </td>
        <td> Requirement </td>
        <td> Trainee Details </td>
    </tr>
    <tr>
        <td> Marks - Class 10  </td>
        <%
        System.out.println("           "+tbean.getMarks10());
        %>
        <td> <%=dempojo.getMarks10() %> </td>
        <td> <%=tbean.getMarks10() %></td>
        
        <td> <%if(dempojo.getMarks10() < tbean.getMarks10())
        	        out.println("Y");%></td>
    </tr>
    <tr>
        <td> Marks - Class 12</td>
        <td> <%=dempojo.getMarks12() %> </td>
        <td> <%=tbean.getMarks12() %></td>
        <td> <%if(dempojo.getMarks12() <= tbean.getMarks12())
        	        out.println("Y");%></td>
    </tr>
    <tr>
        <td> Marks - UG </td>
        <td> <%=dempojo.getMarksUG() %> </td>
        <td> <%=tbean.getMarksug() %></td>
                <td> <%if(dempojo.getMarksUG() <= tbean.getMarksug())
        	        out.println("Y");%></td>
    </tr>
    <tr>
        <td> Marks - PG</td>
        <td> <%=dempojo.getMarksPG() %> </td>
        <td> <%=tbean.getMarkspg() %></td>
        <td><% if((dempojo.getDegrees().contains(tbean.getLgrad()) && (tbean.getLgrad().substring(0, 1).equals("B")) 
            		|| tbean.getMarkspg() >= dempojo.getMarksPG()))
            	out.println("Y");		
            %></td> 
    </tr>
    <tr>
        <td> Certification Required </td>
        <td> <%=dempojo.getCertification() %> </td>
        <td> <%=tbean.getCertification() %></td>
        <td> <%if(dempojo.getCertification().equals(tbean.getCertification()) || dempojo.getCertification().equals("Not Applicable"))
               out.println("Y");%></td>
    </tr>
    <tr>
        <td> Gender </td>
        <td> <%=dempojo.getGender() %> </td>
        <td> <%=tbean.getGender() %></td>
        <td> <%if(dempojo.getGender().equals(tbean.getGender()) || dempojo.getGender().equals("Any"))
               out.println("Y");%></td>
    </tr>
    <tr>
        <td> Qualification </td>
        <td>
        <%
            ArrayList<String> degrees = dempojo.getDegrees();
            for(String degree:degrees) {
                out.println(degree); 
            }
        %>
        </td>
        <td> <%=tbean.getLgrad() %></td>
        <td> <%if(dempojo.getDegrees().contains(tbean.getLgrad()))
               out.println("Y");%></td>
    </tr>
    <tr>
        <td> Year Of Last Graduation </td>
        <td> <%=dempojo.getLastGradYear() %> </td>
        <td> <%=tbean.getYgrad() %></td>
        <td> <%
            if(tbean.getYgrad() >= dempojo.getLastGradYear())
            	out.println("Y");
        %>
        </td>
    </tr>
    <tr>
    <td>Special Conditions</td>
    <td><%=dempojo.getSpecialConditions() %>
    </tr>
    <tr>
    <td><b>More Details about the position</b></td>
    </tr>
    <tr>
    <td> Job Title: </td>
    <td> <%=dempojo.getJobTitle() %></td>
    </tr>
    <tr>
    <td> Compensation: </td>
    <td> <%=dempojo.getCompensation() %></td>
    </tr>
    <tr>
    <td> Work Location: </td>
    <td> <%=dempojo.getLocation() %></td>
    </tr>
    <tr>
    <td> Bond Agreement Details: </td>
    <td> <%=dempojo.getBondDetails() %></td>
    </tr>
    <tr>
    <td> Bond Duration: </td>
    <td> <%=dempojo.getBondDuration() %></td>
    </tr><tr>
    <td> No. Of Positions: </td>
    <td> <%=dempojo.getNumberOfPositions() %></td>
    </tr>
    </table>
    <%  
        if(eligible == true) { 
        	 out.println("Trainee "+tbean.getTraineeid()+" is <b>eligible</b> for the demand.<br>");
        %>
        <form action="applytrainee" method="post">
            <input type="hidden" value=<%=eligible %> name="eligible">
            <input type="hidden" value="<%=dempojo.getDemand_id() %>" name="demand_id">
            <input type="hidden" value="<%=tbean.getTraineeid() %>" name="traineeId">
            <input type="submit" value="Apply">
        </form>
        <%  } else {
        	 out.println("Trainee "+tbean.getTraineeid()+" is <b>not eligible</b> for the demand.<br>");
        }
        %>
        </table>
        </div>
        </div>
        <div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>
</html>