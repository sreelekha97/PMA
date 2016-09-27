<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    }
    </style>
<title>Trainee Upload</title>
</head>
<body>
<div id="header">
    <h1><a href="home.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt="talentsprint" style="width:6%; float="left">
    </a></h1>
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

    <div id="section">
    <br><br>
<h2 align ="center"><font color="orange">UPLOAD TRAINEE LIST IN BULK</font></h2>

<form action = FileUpload>
<center>
<input type = file name = Details value = Upload><br><br>
<button type="submit"  class="btn btn-success" >UPLOAD FILE</button>

</center>
</form>
</div>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>

</html>
