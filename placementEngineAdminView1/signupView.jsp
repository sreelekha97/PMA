<%@page import="com.ts.demand.pojo.DemandPojo"%>
<%@page import="com.ts.demand.partner.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ts.demand.partner.dao.DemandDAO"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<html>
<head>
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <link href="http://getbootstrap.com/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="http://getbootstrap.com/dist/js/bootstrap.js"></script>
    <script src="http://1000hz.github.io/bootstrap-validator/dist/validator.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src = https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css> </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src = "https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
            type="text/javascript"></script>
             <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
  <script data-require="bootstrap@3.1.1" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
  <link data-require="bootstrap-css@3.1.1" data-semver="3.1.1" rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
  <link rel="stylesheet" href="style.css" />
  <script src="script.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#accountForm {
    margin-top: 15px;
}
</style>
<script type="text/javascript">
    var datefield = document.createElement("input")
    datefield.setAttribute("type", "date")
    if (datefield.type != "date") {
        document.write('<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />\n')
        document.write('<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"><\/script>\n')
        document.write('<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"><\/script>\n')
    }
</script>
    <script>
    if (datefield.type != "date") {
        jQuery(function($) {
            $('#date').datepicker({
                dateFormat : 'yy/mm/dd',
                
            });
        })
    }
</script>



<script>
  function EnabledTextBox(active){
     var active = document.getElementById("active");
      var reason = document.getElementById("reason");
     if(active.checked)
            reason.disabled = true;
    else
            reason.disabled = false;
             active.value("FALSE");
  }
</script>
<style>
<link rel="stylesheet" href="css/datepicker.css">
<link rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
    .mytable{
        margin: 40px;
    }
</style>
  
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/start/jquery-ui.css"
          rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $("#txtFrom").datepicker({
            	dateFormat : 'yy/mm/dd',
                numberOfMonths: 1,
                onSelect: function (selected) {
                    var dt = new Date(selected);
                    dt.setDate(dt.getDate() + 1);
                    $("#txtTo").datepicker("option", "minDate", dt);
                }
            });
            $("#txtTo").datepicker({
            	dateFormat : 'yy/mm/dd',
                numberOfMonths: 1,
                onSelect: function (selected) {
                    var dt = new Date(selected);
                    dt.setDate(dt.getDate() - 1);
                    $("#txtFrom").datepicker("option", "maxDate", dt);
                }
            });
        });
    </script>    
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
    #container {
        font-size:15px;
    }
    sup{
        font-size:15px;
    }
    .required.control-label:after{font-size:17px;}
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
    sup {
        font-size:15px
    }
    .required.control-label:after {
        content:"*";
        color:red
    }
    </style>
    
<style>
<link rel="stylesheet" href="css/datepicker.css">
<link rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
    .mytable{
        margin: 40px;
    }
</style>

</head>

<body>
<jsp:include page = "layout.jsp"></jsp:include>
<div id="section">

<a href = "UIHome.jsp"><br><button type="button" name="back" class="btn btn-success">BACK</button></a>

<br><br>
<h1 align ="center"><font color = "Orange">ADD ADMIN/USER</font></h1><br>

	<form method = "post" action="signupcontroller">
		<div id = container>
<label for="name">Admin Name:</label>
<input type="text" id="name" name="user" placeholder = "Enter Username" required name = "user">

<label for="website">Role:</label>
<input type="text" id="role" name="role" placeholder = "Enter Role" required>
<div id="lower">
<input type="submit"  name = "login" value="Add User ">
</div>
</div>
</form>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</div>

</body>
</html>
	
