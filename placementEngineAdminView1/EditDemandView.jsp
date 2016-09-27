<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
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
<a href = "DemandView.jsp"><br><button type="button" name="back" class="btn btn-success">BACK</button></a>
<div class ="mytable">
<br><br>
<h1 align ="center"><font color = "Orange">UPDATE DEMAND</font></h1><br>
 <%
    DemandPojo dempojo = (DemandPojo)request.getAttribute("demand_pojo");
    ArrayList<String> skills = dempojo.getSkills();
    SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd");
    %>
    <script type="text/javascript">
    $(document).ready(function(){
        $("#lastGradYear").val("<%=dempojo.getLastGradYear() %>");
        $("[name=gender]").val(["<%=dempojo.getGender() %>"]);
        $("#certification").val("<%=dempojo.getCertification() %>");
        $("#constraintLocation").val("<%=dempojo.getConstraintLocation() %>");
        <% 
        for(String skill:skills) {
        %>
            $("#"+"<%=skill%>").attr("checked", "checked");
        <%
        }
        %>
    });
    </script>
 <div class="well">
 <ul class="nav nav-tabs"  id="guide-tabs">
    <li class="active"><a href="#tabs-1" data-toggle="tab">Basic Information <i class="fa"></i></a></li>
    <li><a href="#tabs-2" data-toggle="tab">Academic Information <i class="fa"></i></a></li>
    <li><a href="#tabs-3" data-toggle="tab">Skills and Job Details <i class="fa"></i></a></li>
    <li><a href="#tabs-4" data-toggle="tab">Bond Details <i class="fa"></i></a></li>
    <li><a href="#tabs-5" data-toggle="tab">Other Details <i class="fa"></i></a></li>
</ul>
<form id="tabs" method="post" action = "adddemand" name = "f" data-toggle="validator" class="form-horizontal"role = "form">
    <p id = "demo"></p>
    <div class="tab-content">
        <div class="tab-pane active" id="tabs-1">
           <div class="form-group">
                <label class="col-xs-3 control-label">Ref Id: </label>
                <div class="col-xs-5">
                    <input type="text"  class="form-control" name="ref_id" data-error = "please enter a valid id" placeholder = "enter ref id"required>
                    <div class = "help-block with-errors"></div>               
                </div>
            </div>
            <div class="form-group">
                 <label class="col-xs-3 control-label">Gender: </label>
                <div class="col-xs-5">
                    <select class="form-control" name="gender" required>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="any">Any</option>
               </select>
               </div>
               <div class = "help-block with-errors"></div>
            </div>
            
            <div class="form-group">
            
             <label for="endDate" class="col-xs-3 control-label">End Date:</label>
             <div class="col-xs-5">
            <input type="date" id=date style="width: 230px;height:35px;" name="endDate" value="<%=ft.format(dempojo.getEndDate()) %>" required>
           <div class = "help-block with-errors"></div>
   </div>
   </div>
   
</div>
       
        <div class="tab-pane" id="tabs-2">
            <div class="form-group">
                <label  for = "degrees" class="col-xs-3 control-label">Degree: </label>
                <select id="degree" name="degree" onChange="checkOption(this)">
                <option value="UG">UG</option>
        <option value="PG">PG</option>
    </select>
    <select id="degree_course" name="degree_course" onChange="checkField(this)"> 
        <option value="B.Tech">B.Tech</option>
        <option value="B.E">B.E</option>
        <option value="B.Sc">B.Sc</option>
    </select>
    <select id="specialization" name="specialization"> 
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
        var mtech_fields = new Array('Information Systems', 'Power Engineering', 'Micro Electronics and VLSI', 'Control and Automation');
        
        /* var input = document.getElementById("markspg");
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
    
        } */
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
        var bsc_fields = new Array('Information Systems', 'Data Analysis','Software Engineering', 'Physics', 'Chemistry', 'Applied Biology');
        var mtech_fields = new Array('Information Systems', 'Power Engineering', 'Micro Electronics and VLSI', 'Control and Automation');
        var mba_fields = new Array('Finance', 'Human Resource', 'Marketing Management', 'Banking', 'Retail Management');    
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
                    <label for="lastGradYear" class="control-label" value="<%=dempojo.getLastGradYear() %>">Year-of-Graduation:</label>
        
       <select id="lastGradYear" name = "lastGradYear"></select>
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
                <label class="col-xs-3 control-label">Marks in PG: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control" id="inputValue" name="marksPG" value="<%=dempojo.getMarksPG() %>" required>
               <div class = "help-block with-errors"></div>
                </div>
            </div>

             <div class="form-group">
                <label class="col-xs-3 control-label">Marks in UG: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control" id="inputKey" name="marksUG" value="<%=dempojo.getMarksUG() %>" required>
                <div class = "help-block with-errors"></div>
                </div>
  
            </div>

<div class="form-group">
                <label class="col-xs-3 control-label">Marks in Class 12: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control" id="inputValue" name="marks12" value="<%=dempojo.getMarks12() %>" required>
        
                <div class = "help-block with-errors"></div>
                </div>
            </div>


<div class="form-group">
                <label class="col-xs-3 control-label">Marks in Class 10: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control" id="inputKey" name="marks10" value="<%=dempojo.getMarks10() %>" required>
       
               <div class = "help-block with-errors"></div>
                </div>
            </div>
  </div>
 <div class="tab-pane" id="tabs-3">
            <div class="form-group">
                <label class="col-xs-3 control-label">Skills:</label>
                     <label class="checkbox-inline"><input type="checkbox" value="Java" name="skills">JAVA</label>
                    <label class="checkbox-inline"><input type="checkbox" value="Testing" name="skills">Testing</label>
                    <label class="checkbox-inline"><input type="checkbox" value="PL/SQL" name="skills">PL/SQL</label>
                    <label class="checkbox-inline"><input type="checkbox" value="Banking" name="skills">Banking</label>
             <div class = "help-block with-errors"></div>
                </div>
                
                 <div class="form-group">
                <label class="col-xs-3 control-label">Job Title: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control" name="jobTitle" value="<%=dempojo.getJobTitle() %>" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>
            
             <div class="form-group">
                <label class="col-xs-3 control-label">Job Description: </label>
                <div class="col-xs-5">
                <textarea class="form-control" style="height: 134px; width: 500px;" name="jobDescription" required >
    <%=dempojo.getJobDescription() %></textarea>
               <div class = "help-block with-errors"></div>
                </div>
            </div>
                
            
          <script type="text/javascript">
				function Check(val){
 					var element=document.getElementById('constraintLocation');
				    if(val=='Others'){
                   		 element.style.display='block';
					 }
 					else  {
 					     element.style.display='none';
 					     document.getElementById('constraintLocation').value = val;
					 }
				}
			</script>    
            
            <div class="form-group">
                <label class="col-xs-3 control-label">Constraint Location: </label>
                <div class="col-xs-5">
                 <select class="form-control" name="constraintLocation" onchange='Check(this.value);'value="<%=dempojo.getConstraintLocation() %>" required>
                        <option value="None">select</option>
                        <option value="Hyderabad">Hyderabad</option>
                        <option value="Chennai">Chennai</option>
                        <option value="Bangalore">Bangalore</option>
                        <option value = "Mumbai">Mumbai</option>
                        <option value = "Others">Others</option>
                 </select>
                 <input type="text" name="constraintLocation" id="constraintLocation" placeholder="Enter location" style='display:none;'/>
               </div>        
            <div class="form-group">
                <label class="col-xs-3 control-label">Number of positions: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control" name="numberOfPositions" value="<%=dempojo.getNumberOfPositions() %>" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-xs-3 control-label">Compensation: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control" name="compensation" value="<%=dempojo.getCompensation() %>" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>
            
            </div>

         <div class="tab-pane" id="tabs-4">
              <div class="form-group">
                <label class="col-xs-3 control-label">Bond Agreement Details: </label>
                <div class="col-xs-5">
                <textarea class="form-control" style = "height: 134px; width: 500px;" name = "bondDetails">
      <%=dempojo.getBondDetails() %></textarea>
                <div class = "help-block with-errors"></div>
                </div>
            </div>
            
             <div class="form-group">
                <label class="col-xs-3 control-label">Bond Duration: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control" name = "bondDuration" value="<%=dempojo.getBondDuration() %>" >
                <div class = "help-block with-errors"></div>
                </div>
            </div>
            </div>
            <div class="tab-pane" id="tabs-5">
                <div class="form-group">
                <label class="col-xs-3 control-label">Certification: </label>
                <div class="col-xs-5">
                 <select class="form-control" name="certification">
                        <option value="None">select</option>
                        <option value="AB">Not Applicable</option>
                        <option value="FR">Applicable</option>
                        <option value="DE">Specific</option>
                 </select>
               </div>
             <div class = "help-block with-errors"></div>
           </div>
           <div class="form-group">
               <label for = "specialConditions" class = "col-xs-3 control-label">Special Conditions:</label>
               <div class="col-xs-5">
               <textarea class="form-control" style="height: 134px; width: 500px;" name="specialConditions">
        <%=dempojo.getSpecialConditions() %></textarea> 
               <div class = "help-block with-errors"></div>  
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
    <input type="hidden" value="<%=dempojo.getContact_id() %>" name="contact_id">
        <input type="hidden" value="<%=dempojo.getPartner_id() %>" name="partner_id">  
        <input type="hidden" value="<%=dempojo.getDemand_id() %>" name="demand_id"> 
              <h3 align="center"><button type="submit" class = "btn btn-success" onclick = "return alertName()">Update Demand <span class="glyphicon glyphicon-plus"></button></h3>
    </div>
</form>

<br>
<br>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
<script type = "text/javascript">
    function alertName(){
    alert("Form has been updated");
}
</script>
</body>
</html>
