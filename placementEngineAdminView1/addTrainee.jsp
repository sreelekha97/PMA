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
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
    #container {
        font-size:25px;
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
<script type="text/javascript">
             function textpop(x)
             {if (x.localeCompare("Other")== 0)
             {document.getElementById("batch").style.visibility='visible'}
             
             else {document.getElementById("batch").style.visibility='hidden'};
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
   ConnectionDAO cdao = new ConnectionDAO();
   Connection con =  cdao.getConnection();
   PreparedStatement pst;
   ResultSet rs;
   pst = con.prepareStatement("select distinct(batch) from ts_trainee");
   rs = pst.executeQuery();
   String user =session.getAttribute("U").toString();
%>

<body>
<jsp:include page = "layout.jsp"></jsp:include>
<!-- <div id="header">
<h1><a href="home.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt = "talentsprint" style="width:6%; float = "left" ></a></h1>
<form action = "logoutcontroller">
	<button style = "margin-left:1000px;margin-top:3px;" type="submit" class="btn btn-success">Logout</button>     
 </form> 
 -->


<a href = "ListTraineeView.jsp"><br><button type="button" name="back" class="btn btn-success">BACK</button></a>

<div class ="mytable">
<h1 align ="center"><font color = "Orange">ADD TRAINEE</font></h1><br>

 <div class="well">
 <ul class="nav nav-tabs"  id="guide-tabs">
    <li class="active"><a href="#tabs-1" data-toggle="tab">Personal Information <i class="fa"></i></a></li>
    <li><a href="#tabs-2" data-toggle="tab">Academic Information <i class="fa"></i></a></li>
    <li><a href="#tabs-3" data-toggle="tab">Technical Information <i class="fa"></i></a></li>
    <li><a href="#tabs-4" data-toggle="tab">Membership Information <i class="fa"></i></a></li>
</ul>
<form id="tabs" method="post" action = "AddTrainee" name = "f" class="form-horizontal"role = "form" data-toggle="validator">
    <p id = "demo"></p>
    <div class="tab-content">
        <div class="tab-pane active" id="tabs-1">
           <div class="form-group">
                <label class="col-xs-3 control-label">Trainee Id: </label>
                <div class="col-xs-5">
                    <input type="text"  class="form-control" style="max-width: 300;" name="traineeid" placeholder = "Enter Trainee Id"data-error = "Please enter a valid id" required>
                    <div class = "help-block with-errors"></div>               
                </div>
            </div>
        
            <div class="form-group">
                <label class="col-xs-3 control-label">Name: </label>
                <div class="col-xs-5">
                    <input type="text" class="form-control"  style="max-width: 300;" name="name" placeholder = "Enter Name" data-error = "Please enter valid name" pattern = "[a-z A-Z]+" required>
                    <div class = "help-block with-errors"></div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-3 control-label" >Batch: </label>
                <div class="col-xs-5" >
                <select class="form-control"  style="max-width: 300;" name="batch" onchange= "textpop(this.value)">
					<option value= " ">Select</option>
                   <%  while(rs.next()){ %>
                   <option value = <%=rs.getString(1)%>><%= rs.getString(1)%></option>
                   <% } %>
                   <option value = "Other"> Other </option>
                   <%
                   System.out.println("hello how are you?");%>
                </select> 
                <input type = "text" id = "batch" name="batch-other" style="visibility:hidden;"/>
                 </div>
            </div>
             
            
            <div class="form-group">
                 <label class="col-xs-3 control-label">Gender: </label>
                <div class="col-xs-5">
                    <select class="form-control"   style="max-width: 300;" name="gender">
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
            <input type=date placeholder="Select Date"id=date class="form-control"  style="max-width: 300;" name="dob" onchange="Javascript:myAgeValidation()" required>
            <div class = "help-block with-errors"></div>
   </div>
   </div>
       
 <div class="form-group">
                <label class="col-xs-3 control-label">Email Id: </label>
                <div class="col-xs-5">
                    <input type = "email" class="form-control"  style="max-width: 300;"id="email" name="email" pattern ="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" data-error = "Please enter correct email with @" placeholder = "Enter Email-id" required>
                 <div class = "help-block with-errors"></div>
                </div>
            </div>

             <div class="form-group">
                <label class="col-xs-3 control-label">Mobile: </label>
                <div class="col-xs-5">
                    <input type="text" class="form-control bfh-phone" style="max-width: 300;" data-error = "Please enter a correct 10 digit number" name = "mobile" pattern = "^[789]\d{9}$" placeholder="Enter Phone number" required>
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
        
        
        
       <div class="tab-pane" id="tabs-2">
            <div class="form-group">
                <label  for = "lgrade" class="col-xs-3 control-label">Last Graduation: </label>
                <select id="lgrad"  style="max-width: 100;" name="lgrad" onChange="checkOption(this)">
                <option value="UG">UG</option>
        		<option value="PG">PG</option>
    			</select>
    <select id="lgrad_course" style="max-width: 100;" name="lgrad_course" onChange="checkField(this)"> 
        <option value="B.Tech">B.Tech</option>
        <option value="B.E">B.E</option>
        <option value="B.Sc">B.Sc</option>
    </select>
    <select id="specialization" style="max-width: 100;"name="specialization"> 
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
    	var mtech_fields = new Array('InformationSystems', 'PowerEngineering' , 'Control&Automation');
    	
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
    	var mtech_fields = new Array('InformationSystems', 'PowerEngineering', 'Control&Automation');
    	var mba_fields = new Array('Finance', 'HumanResource', 'MarketingManagement', 'Banking', 'RetailManagement');	
    	var lgrad = document.getElementById("lgrad");
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
                <input type = "text" class="form-control" style="max-width: 300;" id= "cname" name = "cname" placeholder = "Enter College Name" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>

            <div class="form-group">
                    <label for="ygrad" class = "col-xs-3 control-label">Year of Graduation:</label>
       				<select id="ygrad" class = "form-control" style="max-width: 300;" name = "ygrad"></select>
        			<script>
var max = new Date().getFullYear(),
    min = max - 7;
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
                
     <select id="yinter" class = "form-control" style="max-width: 300;" name = "yinter" ></select>
     <script>
     var max = new Date().getFullYear(),
     min = max - 13;
     select = document.getElementById('yinter');
     for (var i = min; i<=max-5; i++){
        var opt = document.createElement('option');
        opt.value = i;
        opt.innerHTML = i;
        select.appendChild(opt);
     }
              </script>
               </div>
        
               <div class="form-group">
               <label class="col-xs-3 control-label">Year of SSC: </label>
               <select id ="yssc" class = "form-control" style="max-width: 300;" name ="yssc"></select>
               <script>
             var max = new Date().getFullYear(),
             min = max - 15;
             select = document.getElementById('yssc');
             for (var i = min; i<=max-7; i++){
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
               <input type="text" class="form-control" style="max-width: 300;"id="markspg" name = "markspg" pattern = "[5-9][0-9]" placeholder="PG Marks" data-error ="The  percentage limit between 50-99" required>
               <div class = "help-block with-errors"></div>
               </div>
               </div>

               <div class="form-group">
               <label class="col-xs-3 control-label">Marks in UG: </label>
               <div class="col-xs-5">
               <input type="text" class="form-control" style="max-width: 300;" id="marksug" name = "marksug" pattern = "[5-9][0-9]" placeholder="UG Marks" data-error ="The  percentage limit between 50-99"required>
               <div class = "help-block with-errors"></div>
               </div>
               </div>

               <div class="form-group">
               <label class="col-xs-3 control-label">Marks in Class 12: </label>
               <div class="col-xs-5">
               <input type="text" class="form-control"  style="max-width: 300;" id="marks12" name = "marks12" pattern = "[5-9][0-9]" placeholder="Class12 Marks" data-error ="The  percentage limit between 50-99" required>
               <div class = "help-block with-errors"></div>
               </div>
               </div>


               <div class="form-group">
               <label class="col-xs-3 control-label">Marks in Class 10: </label>
               <div class="col-xs-5">
               <input type="text" class="form-control"  style="max-width: 300;" id="marks10" name = "marks10" pattern = "[5-9][0-9]" placeholder="Class10 Marks" data-error ="The  percentage limit between 50-99" required>
               <div class = "help-block with-errors"></div>
               </div>
               </div>
             
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
                <select class="form-control" style="max-width: 300;" name="certification" required>
                        <option value="">select</option>
                        <option value="NotApplicable">NotApplicable</option>
                        <option value="Applicable">Applicable</option>
                        <option value="Specific">Specific</option>
                </select>
                <div class = "help-block with-errors"></div>
                </div>
                </div>
               
                <div class="form-group">
                <label class="col-xs-3 control-label">Communication Grade: </label>
                <div class="col-xs-5">
                <select class="form-control" style="max-width: 300;" name="comgrade" required>
                        <option value="">select</option>
                        <option value="A">A-Excellent</option>
                        <option value="B">B-Very Good</option>
                        <option value="C">C-Good</option>
                        <option value="D">D-Average</option>
                         <option value="E">E-Poor</option>
                </select>
                <div class = "help-block with-errors"></div>
                </div>
                </div>
               

                <div class="form-group">
                <label class="col-xs-3 control-label">Technical Grade: </label>
                <div class="col-xs-5">
                <select class="form-control" style="max-width: 300;" name="tgrade" required>
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
                 <br>

				<div class="form-group">
                <label class="col-xs-3 control-label">Project Grade: </label>
                <div class="col-xs-5">
                 <select class="form-control" style="max-width: 300;" name="pgrade" required>
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
                   <br>
				<div class="form-group">
                <label class="col-xs-3 control-label"> Aptitude Grade: </label>
                <div class="col-xs-5">
                <select class="form-control"  style="max-width: 300;" name="agrade" required>
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
                 
                 <div align="center">
                 <a id="test3" class="btn btn-default" >next</a>
                 </div>
             
</div>

<div class="tab-pane" id="tabs-4">
                  <div class="form-group">
                  <label class="col-xs-3 control-label">Active</label>
                  <input  class = "checkifactive" type="checkbox" name = "active" value = "true" id = "active" onclick = "EnabledTextBox(this)"  >
                  </div>
                 
                  <div class="form-group">   
                  <label for="vfrom" class="col-xs-3 control-label">Reason:</label>
                  <input type =  text class="form-control" style = "width: 300px;" id="reason" placeholder="Enter reason" name = "reason" >
                  <br>
                  </div>
                  
                  <div class="form-group">   
                  <label for="vfrom" class="col-xs-3 control-label">Valid From:</label>
	              <input type=text id =txtFrom placeholder="Select Date" class="form-control" style="width: 300px;height:35px;" name="vfrom" required >
	            <!--   <div class = "help-block with-errors"></div> -->
			      </div>
	
                  <div class="form-group">  
	              <label for="vto" class="col-xs-3 control-label">Valid To:</label>
                  <input type=text id = txtTo placeholder="Select Date" class="form-control" style="width: 300px;height:35px;" name="vto">
                  <!-- <div class = "help-block with-errors"></div> -->
                  </div>
                  
                  <div class="form-group">
                  <label  for="verify" class="col-xs-3 control-label">Verified By: </label>
                  <input type="text" class="form-control" style = "width: 300px;" id="verify" name = "verify" placeholder="Verified by" value = <%=user%> required>
                  </div>
                  <div align="center">
              <h3 align="center"><button type="submit" class = "btn btn-success">Add Trainee  <span class="glyphicon glyphicon-plus"></button></h3>
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
	
</form>

<br>
<br>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
            type="text/javascript"></script>
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
</body>
</html>
	
