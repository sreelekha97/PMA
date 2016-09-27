<%@page import="com.ts.demand.pojo.DemandPojo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ts.demand.partner.dao.DemandDAO"%>
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
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"type="text/javascript"></script>
  <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
  <script data-require="bootstrap@3.1.1" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
  <link data-require="bootstrap-css@3.1.1" data-semver="3.1.1" rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
  <link rel="stylesheet" href="style.css" />
  <script src="script.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
        font-size:25px;
        overflow:hidden;
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
        function myAgeValidation() {
           var lre = /^\s*/;
           var datemsg = "";  
           var inputDate = document.f.dob.value;
           inputDate = inputDate.replace(lre, "");
           document.f.dob.value = inputDate;
           datemsg = isValidDate(inputDate);
           if (datemsg != "") {
               alert(datemsg);
               return;
           }
           else {
               //Now find the Age based on the Birth Date
               getAge(new Date(inputDate));
            }
        }
        function getAge(birth) {
            var today = new Date();
            var nowyear = today.getFullYear();
            var nowmonth = today.getMonth();
            var nowday = today.getDate();
            var birthyear = birth.getFullYear();
            var birthmonth = birth.getMonth();
            var birthday = birth.getDate();
            var age = nowyear - birthyear;
            var age_month = nowmonth - birthmonth;
            var age_day = nowday - birthday;
            if(age_month < 0 || (age_month == 0 && age_day <0)) {
                age = parseInt(age) -1;
            }
            //alert(age);
            if ((age <= 25 ) && ( age >= 20)) {
                document.f.agree.disabled=false;
            } else {
                alert("age limit is 20 - 25");
            }
        }
        function isValidDate(dateStr) {   
            var msg = "";
            var datePat = /^(\d{4})(\/|-)(\d{1,2})(\/|-)(\d{1,2})$/;
            var matchArray = dateStr.match(datePat); // is the format ok?
            if (matchArray == null) {
                msg = "Date is not in a valid format.";       
                return msg; 
            }
            month = matchArray[2]; // parse date into variables
            day = matchArray[3];
            year = matchArray[1];   
            if (month < 1 || month > 12) { // check month range
                msg = "Month must be between 1 and 12.";
                return msg;
            }
            if (day < 1 || day > 31) {
                msg = "Day must be between 1 and 31.";
                return msg;
            }
            if ((month==4 || month==6 || month==9 || month==11) && day==31) {
                msg = "Month "+month+" doesn't have 31 days!";
                return msg;
            }
            if (month == 2) { // check for february 29th
                var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
                if (day>29 || (day==29 && !isleap)) {
                    msg = "February " + year + " doesn't have " + day + " days!";
                    return msg;
                }
            }
            if (day.charAt(0) == '0') day= day.charAt(1);
                return msg;  // date is valid
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

</head>
 <%
  String username = (String)session.getAttribute("U");
  %>
<body onload = "myFunction()">
<jsp:include page = "layout.jsp"></jsp:include>
<!-- <div id="header">
<h1><a href="home.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt = "talentsprint" style="width:6%; float = "left" ></a></h1>
 -->
<a href = "ListTraineeView.jsp"><br><button type="button" name="back" class="btn btn-success">BACK</button></a>
<%
     String batch = request.getParameter("batch");
     String certification = request.getParameter("certification");
     String comgrade = request.getParameter("comgrade");
     System.out.println(comgrade+"this is comgrade");
     String email = request.getParameter("email");
     String name = request.getParameter("name");
     System.out.println(name);
     String gender = request.getParameter("gender");
     System.out.println(gender);
     String cname = request.getParameter("cname");
     String lgrad = request.getParameter("lgrad");
     System.out.println(lgrad+"gender is"+gender);
     
     System.out.println(request.getParameter("marks10"));
     int marks10 = Integer.parseInt(request.getParameter("marks10"));
     int marks12 = Integer.parseInt(request.getParameter("marks12"));
     int markspg =Integer.parseInt(request.getParameter("markspg"));
     int marksug =Integer.parseInt(request.getParameter("marksug"));
     String mobile = request.getParameter("mobile");
     String pgrade = request.getParameter("pgrade");
     String skill = request.getParameter("skill");
     String tgrade = request.getParameter("tgrade");
     String traineeid = request.getParameter("traineeid");
     String verify = request.getParameter("verify");
     String agrade = request.getParameter("agrade");
     String vfrom = request.getParameter("vfrom");
     String vto = request.getParameter("vto");
     String clocation = request.getParameter("clocation");
     System.out.println(clocation);
     String dob = request.getParameter("dob");
     String reason = request.getParameter("reason");
     int ygrad = Integer.parseInt(request.getParameter("ygrad"));
     int yinter =Integer.parseInt(request.getParameter("yinter"));
     int yssc = Integer.parseInt(request.getParameter("yssc"));
     boolean active = Boolean.parseBoolean(request.getParameter("active"));
     String ugpg;
     if(lgrad.charAt(0) == 'B') {
    	 ugpg = "UG";
     } else {
    	 ugpg = "PG";
     }
     String field = lgrad.split("-")[0];
     String specialization = lgrad.split("-")[1];
     System.out.println(ugpg+"  "+field+"   "+specialization);
    %>
 
 
 <script>
function myFunction() {
	document.getElementById("gender").value = '<%=gender%>';
	document.getElementById("comgrade").value = '<%=comgrade%>';	
    document.getElementById("tgrade").value = '<%=tgrade%>';
    document.getElementById("pgrade").value = '<%=pgrade%>';
    document.getElementById("cert").value = '<%=certification%>';
    document.getElementById("agrade").value = '<%=agrade%>'; 
    document.getElementById("yinter").value = '<%=yinter%>';
    document.getElementById("yssc").value = '<%=yssc%>';
    document.getElementById("ygrad").value = '<%=ygrad%>';
}
</script>
 
       
<div class ="mytable">
<h1 align ="center"><font color = "Orange">UPDATE TRAINEE</font></h1><br>

 <div class="well">

  
 <ul class="nav nav-tabs"  id="guide-tabs" >
    <li class="active"><a href="#tabs-1" data-toggle="tab">Personal Information <i class="fa"></i></a></li>
    <li><a href="#tabs-2" data-toggle="tab">Academic Information <i class="fa"></i></a></li>
    <li><a href="#tabs-3" data-toggle="tab">Technical Information <i class="fa"></i></a></li>
    <li><a href="#tabs-4" data-toggle="tab">Membership Information <i class="fa"></i></a></li>
</ul>
<%
if(username.equals("admin1")){
%>
<button onclick="able()" id = "edit" class="btn btn-success">Edit</button>
<%} %>
<script>
function able() {
    var x = document.getElementById("myFieldset");
    x.disabled = false;
    var y = document.getElementById("edit");
    y.disabled = true;
}
</script>
<form id="tabs" method="post" action = "Update" name = "f" data-toggle = "validator" class="form-horizontal"role = "form">
   <script>
   $(document).ready(function() {
	var ug_degrees = new Array("B.Tech","B.E","B.Sc");
 	var pg_degrees = new Array("M.Tech","MBA");
 	var btech_fields = new Array('CSE', 'ECE', 'IT', 'EEE', 'Civil', 'Mechanical', 'Areonautical');
 	var be_fields = new Array('CSE', 'ECE', 'IT', 'EEE', 'Civil', 'Mechanical', 'Areonautical');
	var bsc_fields = new Array('InformationSystems', 'DataAnalysis','SoftwareEngineering', 'Physics', 'Chemistry', 'AppliedBiology');
	var mtech_fields = new Array('InformationSystems', 'PowerEngineering', 'MicroElectronics&VLSI');
	var mba_fields = new Array('Finance', 'HumanResource', 'MarketingManagement', 'Banking', 'RetailManagement');	
 	var ugpg = "<%=ugpg %>";
 	var field = "<%=field %>";
 	var specialization = "<%=specialization %>";
	$("[name='gender']").val("<%=gender%>");
	$("[name='ygrad']").val("<%=ygrad%>");
	$("[name='yinter']").val("<%=yinter%>");
	$("[name='yssc']").val("<%=yssc%>");
	$("[name='certification']").val("<%=certification%>");
	$("#lgrad").val(ugpg);
	if(ugpg == "UG") {
		$('#markspg').attr('disabled', true);
		$('#markspg').val(null);
		$("#lgrad_course").html('');
        ug_degrees.forEach(function(t) { 
            $('#lgrad_course').append('<option value='+t+'>'+t+'</option>');
        });
	} else if(ugpg == "PG") {
		$('#markspg').attr('disabled', false);
		$("#lgrad_course").html('');
        pg_degrees.forEach(function(t) { 
            $('#lgrad_course').append('<option value='+t+'>'+t+'</option>');
        });
	}
	$("#lgrad_course").val(field);
	if(field == "B.Tech") {
		$('#specialization').html('');
        btech_fields.forEach(function(t) { 
            $('#specialization').append('<option value='+t+'>'+t+'</option>');
        });
	} else if(field == "B.E") {
		$('#specialization').html('');
        be_fields.forEach(function(t) { 
            $('#specialization').append('<option value='+t+'>'+t+'</option>');
        });
	} else if(field == "B.Sc") {
		$('#specialization').html('');
        bsc_fields.forEach(function(t) { 
            $('#specialization').append('<option value='+t+'>'+t+'</option>');
        });
	} else if(field == "M.Tech") {
		$('#specialization').html('');
        mtech_fields.forEach(function(t) { 
            $('#specialization').append('<option value='+t+'>'+t+'</option>');
        });
	} else if(field == "MBA") {
		$('#specialization').html('');
        mba_fields.forEach(function(t) { 
            $('#specialization').append('<option value='+t+'>'+t+'</option>');
        });
	}	

	$("#specialization").val(specialization);
   });

   </script>
   <fieldset id = "myFieldset" disabled>
    <p id = "demo"></p>
    <div class="tab-content">
        <div class="tab-pane active" id="tabs-1" data-toggle="collapse">
           <div class="form-group">
                <label class="col-xs-3 control-label" >Trainee Id: </label>
                <div class="col-xs-5">
                
                    <input type="text"  class="form-control" style = "width: 300px;" name="traineeid" value = <%=traineeid%> data-error = "please enter a valid id" placeholder = "Id as TSHYD/TSCHENNAI etc" disabled required>
                    <div class = "help-block with-errors"></div>               
                </div>
            </div>
        
            <div class="form-group">
                <label class="col-xs-3 control-label">Name: </label>
                <div class="col-xs-5">
                    <input type="text" class="form-control" style = "width: 300px;"name="name" value = <%=name%> data-error = "please enter valid name" required>
                    <div class = "help-block with-errors"></div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-3 control-label">Batch: </label>
                <div class="col-xs-5">
                    <input type="text" class="form-control" style = "width: 300px;" value = <%=batch%> data-error = "please enter valid batch" name="batch" placeholder = "morning/afternoon/evening" disabled>
                    <div class = "help-block with-errors"></div>
                </div>
            </div>

            <div class="form-group">
                 <label class="col-xs-3 control-label">Gender: </label>
                <div class="col-xs-5">
   				 		<select class="form-control" style = "width: 300px;" name = "gender" id = "gender">
   				 		           <option value="select">Select</option>
                                   <option value="male">Male</option>
                                   <option value="female">Female</option>
                                   <option value="other">Other</option>
    					</select> 
               </div>
               <div class = "help-block with-errors"></div>
            </div>
            
           <div class="form-group">
           	  <label for="dob" class="col-xs-3 control-label">DOB :</label>
              <div class="col-xs-5">
              <input type=date placeholder="Select Date"id=date value = <%=dob%>  style="width: 300px;height:35px;" onchange="Javascript:myAgeValidation()" name="dob" required>
              <div class = "help-block with-errors"></div>
            </div>
           </div>
       
           <div class="form-group">
                <label class="col-xs-3 control-label">Email Id: </label>
                <div class="col-xs-5">
                    <input type = "email" class="form-control"  style="max-width: 300;"id="email" name="email" value = <%=email%>  data-error = "please enter valid email with @" placeholder = "Enter Email-id" required>
                 <div class = "help-block with-errors"></div>
                </div>
            </div>

             <div class="form-group">
                <label class="col-xs-3 control-label">Mobile: </label>
                <div class="col-xs-5">
                    <input type="text" class="form-control bfh-phone" style="max-width: 300;" name = "mobile"  value = <%=mobile%> pattern = "^\d{10}$"  data-error = "Please enter a correct 10 digit number" placeholder="Phone Number" required>
                   <div class = "help-block with-errors"></div>
                </div>
            </div>

 
          <div class="form-group">
            <label class="col-xs-3 control-label">Current Location: </label>
                <div class="col-xs-5">
                  <select class="form-control" style="max-width: 300;" id = "clocation" name="clocation">
                    <option value="select">Select</option>
                        <option value="Hyderabad">Hyderabad</option>
                        <option value="Chennai">Chennai</option>
                        <option value="Bangalore">Bangalore</option>
                        <option value = "Mumbai">Mumbai</option>
                        <option value = "Others">Others</option>
               </select></div>
           </div>
           
             <div align="center">
             <a id="test" class="btn btn-default" >next</a>
             </div>
 </div>
        
        
        
       <div class="tab-pane" id="tabs-2" data-toggle = "collapse">
            <div class="form-group">
                <label  for = "lgrade" class="col-xs-3 control-label">Last Graduation: </label>
	<select id="lgrad" name="lgrad" onChange="checkOption(this)">
        <option value="UG">UG</option>
        <option value="PG">PG</option>
    </select>
    <select id="lgrad_course" name="lgrad_course" onChange="checkField(this)"> 
        <option value="B.Tech">B.Tech</option>
        <option value="B.E">B.E</option>
        <option value="B.Sc">B.Sc</option>
    </select>
    <select id="specialization" name="specialization" > 
        <option value="CSE">CSE</option>
        <option value="ECE">ECE</option>
        <option value="IT">IT</option>
        <option value="EEE">EEE</option>
        <option value="Civil">Civil</option>
        <option value="Mechanical">Mechanical</option>
        <option value="Aeronautical">Aeronautical</option>
    </select>
    <script>
    function checkOption(obj) {
    	var ug_degrees = new Array("B.Tech","B.E","B.Sc");
    	var pg_degrees = new Array("M.Tech","MBA");
    	var btech_fields = new Array('CSE', 'ECE', 'IT', 'EEE', 'Civil', 'Mechanical', 'Areonautical');
    	var mtech_fields = new Array('InformationSystems', 'PowerEngineering', 'Control&Automation');
    	
        var input = document.getElementById("markspg");
        if(obj.value=="UG") {
            input.disabled = true;
            $('#lgrad_course').html('');
            ug_degrees.forEach(function(t) { 
                $('#lgrad_course').append('<option value='+t+'>'+t+'</option>');
            });
            $('#specialization').html('');
            btech_fields.forEach(function(y) { 
                $('#specialization').append('<option value='+y+'>'+y+'</option>');
            });
        } else {
        	input.disabled = false;
        	$('#lgrad_course').html('');
        	pg_degrees.forEach(function(t) {
                $('#lgrad_course').append('<option value='+t+'>'+t+'</option>');
            });
        	$('#specialization').html('');
            mtech_fields.forEach(function(y) { 
                $('#specialization').append('<option value='+y+'>'+y+'</option>');
            });
        }
    }
    </script>
    <script>
    function checkField(obj) {
    	var btech_fields = new Array('CSE', 'ECE', 'IT', 'EEE', 'Civil', 'Mechanical', 'Areonautical');
    	var be_fields = new Array('CSE', 'ECE', 'IT', 'EEE', 'Civil', 'Mechanical', 'Areonautical');
    	var bsc_fields = new Array('InformationSystems', 'DataAnalysis','SoftwareEngineering', 'Physics', 'Chemistry', 'AppliedBiology');
    	var mtech_fields = new Array('Information Systems', 'Power Engineering', 'Control&Automation');
    	var mba_fields = new Array('Finance', 'HumanResource', 'MarketingManagement', 'Banking', 'RetailManagement');	
    	var lgrad = document.getElementById("lgrad");
    	//var course = document.getElementById("lgrad_course");
    	if(obj.value == "B.Tech") {
    		$('#specialization').html('');
            btech_fields.forEach(function(t) { 
                $('#specialization').append('<option value='+t+'>'+t+'</option>');
            });
    	} else if(obj.value == "B.E") {
    		$('#specialization').html('');
            be_fields.forEach(function(t) { 
                $('#specialization').append('<option value='+t+'>'+t+'</option>');
            });
    	} else if(obj.value == "B.Sc") {
    		$('#specialization').html('');
            bsc_fields.forEach(function(t) { 
                $('#specialization').append('<option value='+t+'>'+t+'</option>');
            });
    	} else if(obj.value == "M.Tech") {
    		$('#specialization').html('');
            mtech_fields.forEach(function(t) { 
                $('#specialization').append('<option value='+t+'>'+t+'</option>');
            });
    	} else if(obj.value == "MBA") {
    		$('#specialization').html('');
            mba_fields.forEach(function(t) { 
                $('#specialization').append('<option value='+t+'>'+t+'</option>');
            });
    	}
    }
    </script>
    
              
              
               <div class = "help-block with-errors"></div>
             
       </div>

            <div class="form-group">
                <label class="col-xs-3 control-label">College Name: </label>
                <div class="col-xs-5">
                <input class="form-control" style="max-width: 300;" id= "cname" type = "text" name = "cname" value = <%=cname%> placeholder = "College Name" required>
                <div class = "help-block with-errors"></div>
                    </div>
            </div>

            <div class="form-group">
                    <label for="ygrad" class = "col-xs-3 control-label">Year of Graduation:</label>
                   <select class="form-control" style="max-width: 300;"  name = "ygrad" id = "ygrad">
                    </select>
                  <script>
					var max = new Date().getFullYear(),
   					 min = max - 30;
    				select = document.getElementById('ygrad');
					for (var i = min; i<=max; i++){
    				var opt = document.createElement('option');
    				opt.value = i;
    				opt.innerHTML = i;
   					 select.appendChild(opt);
				}
			</script>     
                <div class = "help-block with-errors"></div>
            </div>
        
     <div class="form-group">
                <label for="yinter" class = " col-xs-3 control-label">Year of Inter:</label>
                 <select class="form-control" style="max-width: 300;" name = "yinter" id= "yinter">
                 	                 </select>
      <script>
     var max = new Date().getFullYear(),
     min = max - 30;
     select = document.getElementById('yinter');
     for (var i = min; i<=max; i++){
        var opt = document.createElement('option');
        opt.value = i;
        opt.innerHTML = i;
        select.appendChild(opt);
     }
     </script>
            </div>
        
<div class="form-group">
                <label class="col-xs-3 control-label">Year of SSC: </label>
                <select class="form-control" style="max-width: 300;" name ="yssc" id = "yssc">
                  
                </select>
             <script>
             var max = new Date().getFullYear(),
             min = max - 30;
             select = document.getElementById('yssc');
             for (var i = min; i<=max; i++){
                var opt = document.createElement('option');
                opt.value = i;
                opt.innerHTML = i;
                select.appendChild(opt);
             }
             </script>
            
                </div>
                <div class="form-group">
                <label class="col-xs-3 control-label">Marks in PG: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control"style="max-width: 300;" value = <%=markspg%> name = "markspg"placeholder="PG Marks" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>

             <div class="form-group">
                <label class="col-xs-3 control-label">Marks in UG: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control" style="max-width: 300;"  value = <%=marksug%> name = "marksug"placeholder="UG Marks" required>
                <div class = "help-block with-errors"></div>
                </div>
  
            </div>

<div class="form-group">
                <label class="col-xs-3 control-label">Marks in Class 12: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control"  style="max-width: 300;" value = <%=marks12%> name = "marks12"placeholder="Class12 Marks" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>


<div class="form-group">
                <label class="col-xs-3 control-label">Marks in Class 10: </label>
                <div class="col-xs-5">
               <input type="text" class="form-control"  style="max-width: 300;" value = <%=marks10%> name = "marks10" placeholder="Class10 Marks" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>
                <div class = "help-block with-errors"></div>
            
            
               <div align="center">
             <a id="test1" class="btn btn-default" >next</a>
             </div>
            </div>
 
 <div class="tab-pane" id="tabs-3">
           <div class="form-group">
                <label class="col-xs-3 control-label">Technical Skills: </label>
               <div class="col-xs-5">
                <select class="form-control" style="max-width: 300;" id = "skill" name="skill">
                    <option value="select">Select</option>
                        <option value="Java">Java</option>
                        <option value="Testing">Testing</option>
                        <option value="PL/SQL">PL/SQL</option>
                        <option value = "Banking">Banking</option>
                        <option value = "Others">Others</option>
               </select>
                 <div class = "help-block with-errors"></div>
                </div>
            </div>


 <div class="form-group">
                <label class="col-xs-3 control-label">Certification: </label>
                <div class="col-xs-5">
                 <select class="form-control" style="max-width: 300;"name="certification" id = "cert">
                        <option value="">select</option>
                        <option value="NotApplicable">Not Applicable</option>
                        <option value="Applicable">Applicable</option>
                        <option value="Specific">Specific</option>
                        
                    </select>
               
                </div>
                <div classs = "help-block with-errors"></div>
            </div>

 <div class="form-group">
                <label class="col-xs-3 control-label">Communication Grade: </label>
                <div class="col-xs-5">
                 <select class="form-control" style="max-width: 300;"name="comgrade" id = "comgrade">
                        <option value="">select</option>
                        <option value="A">A-Excellent</option>
                        <option value="B">B-Very Good</option>
                        <option value="C">C-Good</option>
                        <option value="D">D-Average</option>
                         <option value="E">E-Poor</option>
                       
                    </select>
               
                </div>
                <div class = "help-block with-errors"></div>
            </div>

<div class="form-group">
                <label class="col-xs-3 control-label">Technical Grade: </label>
                <div class="col-xs-5">
                 <select class="form-control"  style="max-width: 300;" name="tgrade" id = "tgrade">
                        <option value="">select</option>
                        <option value="A">A-Excellent</option>
                        <option value="B">B-Very Good</option>
                        <option value="C">C-Good</option>
                        <option value="D">D-Average</option>
                         <option value="E">E-Poor</option>
                       
                    </select>
               
                </div>
                <div class = "help-block with-errors"></div>
            </div>

<div class="form-group">
                <label class="col-xs-3 control-label">Project Grade: </label>
                <div class="col-xs-5">
                 <select class="form-control"  style="max-width: 300;"name="pgrade" id = "pgrade">
                        <option value="">select</option>
                        <option value="A">A-Excellent</option>
                        <option value="B">B-Very Good</option>
                        <option value="C">C-Good</option>
                        <option value="D">D-Average</option>
                         <option value="E">E-Poor</option>
                       
                    </select>
               
                </div>
                <div class = "help-block with-errors"></div>
            </div>

<div class="form-group">
                <label class="col-xs-3 control-label"> Aptitude Grade: </label>
                <div class="col-xs-5">
                 <select class="form-control" style="max-width: 300;" name="agrade" id = "agrade" >
                        <option value="" >select</option>
                        <option value="A">A-Excellent</option>
                        <option value="B">B-Very Good</option>
                        <option value="C">C-Good</option>
                        <option value="D">D-Average</option>
                         <option value="E">E-Poor</option>
                       
                    </select>
               
                </div>
                <div class = "help-block with-errors"></div>
            </div>
            <div align="center">
             <a id="test3" class="btn btn-default" >next</a>
             </div>
             
</div>
<div class="tab-pane" id="tabs-4" data-toggle="collapse">
            <div class="form-group">
                <label class="col-xs-3 control-label">
                 <input  class = "checkifactive" type="checkbox" name = "active" value = "true" id = "active" onclick = "EnabledTextBox(this)" checked = "true">
                 Active</label>
                 <input type =  text class="form-control" style="max-width: 300;" style = "width: 300px;" id="reason" placeholder="Enter reason" name = "reason" disabled>
                 <br>
                 
                </div>
                 <div class="form-group">
            <label for="vfrom" class="col-xs-3 control-label">Valid From:</label>
	<div class="col-xs-5">
	<input type=date id = txtFrom placeholder="Select Date" class="form-control" style="max-width: 300;" value = <%=vfrom%> style="width: 180px;height:35px;" name="vfrom" required>
	<div class = "help-block with-errors"></div>
	</div></div>
	 <div class="form-group">
	<label for="vto" class="col-xs-3 control-label">Valid To:</label>
	<div class="col-xs-5">
    <input type=date id = txtTo placeholder="Select Date"  class="form-control" style="max-width: 300;" value = <%=vto%> style="width: 180px;height:35px;" name="vto" required>
    <div class = "help-block with-errors"></div>
</div></div>
            <div class="form-group">
                <label  for="verify" class="col-xs-3 control-label">Verified By: </label>
                <div class="col-xs-5">
                 <input type="text" class="form-control"  style="max-width: 300;" id="verify"  value = <%=verify%> name = "verify" placeholder="Verified by" required>
               
                </div>
            </div>
            </div>
            <script>
  $("#test").click(function() {
    $('#guide-tabs li:eq(1) a').tab('show');
  })
  $("#test1").click(function() {
    $('#guide-tabs li:eq(2) a').tab('show');
  })
  $("#test2").click(function() {
    $('#guide-tabs li:eq(3) a').tab('show');
  })
  $("#test3").click(function() {
    $('#guide-tabs li:eq(4) a').tab('show');
  })
  
</script>
</div>
	<div align="center">
              <h3 align="center"><button type="submit" class = "btn btn-success">Update Trainee  <span class="glyphicon glyphicon-plus"></button></h3>
    </div>
    </fieldset>
</form>

<br>
<br>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>

</body>
</html>