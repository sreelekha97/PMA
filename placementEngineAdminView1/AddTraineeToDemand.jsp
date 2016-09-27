<%@page import="com.ts.demand.partner.dao.DriveDAO"%>
<%@page import="com.ts.demand.partner.dao.Demand"%>
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
<jsp:include page = "layout.jsp"></jsp:include>
<div id = "section">
<div class = "table" align = "center">
<table id = "example" class="table">

<% 
String msg = request.getParameter("msg");
Long demand_id = Long.parseLong(request.getParameter("demand_id"));
if(msg == null) {
    
} else {
	out.println(msg+"<br><br>");
}
%>
<form action="validatetrainee" method="post">
    <input type="text" name="traineeId"/>
    <input type="hidden" name="demand_id" value="<%=demand_id%>"/>
    <input type="submit" value="Add Trainee" title="Click here to Add Trainee"/>

</form>
</table>
</div>
</div>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>
</html>