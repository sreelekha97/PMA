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
  
    <style>
    #container {
        font-size:25px;
    }
    sup{
        font-size:15px;
    }
    .required.control-label:after{font-size:17px;}
   
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
<a href = "DemandView.jsp"><br><button type="button" name="back" class="btn btn-success">BACK</button></a>
<div class ="mytable">
<h1 align ="center"><font color = "Orange">ADD DEMAND</font></h1><br>
 <div class="well">
 <ul class="nav nav-tabs"  id="guide-tabs">
    <li class="active"><a href="#tabs-1" data-toggle="tab">Basic Information <i class="fa"></i></a></li>
    <li><a href="#tabs-2" data-toggle="tab">Academic Information <i class="fa"></i></a></li>
    <li><a href="#tabs-3" data-toggle="tab">Skills and Job Details <i class="fa"></i></a></li>
    <li><a href="#tabs-4" data-toggle="tab">Bond Details <i class="fa"></i></a></li>
    <li><a href="#tabs-5" data-toggle="tab">Other Details <i class="fa"></i></a></li>
</ul>
<form id="tabs" method="post" action = "adddemand" data-toggle="validator" name = "f" class="form-horizontal"role = "form">
    <p id = "demo"></p>
    <div class="tab-content">
        <div class="tab-pane active" id="tabs-1">
           <div class="form-group">
                <label class="col-xs-3 control-label">Ref Id: </label>
                <div class="col-xs-5">
                    <input type="text"  class="form-control" style="max-width: 300;" name="ref_id" data-error = "please enter a valid id" placeholder = "enter ref id" required>
                    <div class = "help-block with-errors"></div>               
                </div>
            </div>
            <div class="form-group">
                 <label class="col-xs-3 control-label">Gender: </label>
                <div class="col-xs-5">
                    <select class="form-control" style="max-width: 300;" name="gender" required>
                         <option value="any">Any</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                       
               </select>
               </div>
               <div class = "help-block with-errors"></div>
            </div>
            
            <div class="form-group">
            
             <label for="endDate" class="col-xs-3 control-label">End Date:</label>
             <div class="col-xs-5">
            <input type=date placeholder="Select Date" class="form-control" style="max-width: 300;" id=date style="width: 230px;height:35px;"  name="endDate" required>
            
   </div>
   </div>
   
</div>
       
        <div class="tab-pane" id="tabs-2">
            <div class="form-group">
                <label  for = "degrees" class="col-xs-3 control-label">Degree: </label>
                <select id="degree" name="degree" onChange="checkOption(this)" required>
                <option value="UG">UG</option>
        <option value="PG">PG</option>
    </select>
    <select id="degree_course" name="degree_course" onChange="checkField(this)"> 
        <option value="B.Tech">B.Tech</option>
        <option value="B.E">B.E</option>
        <option value="B.Sc">B.Sc</option>
        <option value="M.Tech">M.Tech</option>
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
                    <label for="ygrad" class = "col-xs-3 control-label">Year of Graduation:</label>
                    
       <select id="ygrad" class="form-control" style="max-width: 300;"name = "lastGradYear" required></select>
        <script>
var max = new Date().getFullYear(),
    min = max - 115;
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
                <input type="text" class="form-control"  style="max-width: 300;"id="markspg" name = "marksPG" pattern = "^([1-9][0-9]{0,1}(\.[\d]{1,2})?|100)$" data-error = "please enter valid marks"placeholder="PG Marks" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>
             <div class="form-group">
                <label class="col-xs-3 control-label">Marks in UG: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control"  style="max-width: 300;"id="marksUG" pattern = "^([1-9][0-9]{0,1}(\.[\d]{1,2})?|100)$" data-error = "please enter valid marks"name = "marksUG"placeholder="UG Marks" required>
                <div class = "help-block with-errors"></div>
                </div>
  
            </div>
<div class="form-group">
                <label class="col-xs-3 control-label">Marks in Class 12: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control"  style="max-width: 300;"pattern = "^([1-9][0-9]{0,1}(\.[\d]{1,2})?|100)$" data-error = "please enter valid marks"id="marks12" name = "marks12"placeholder="Class12 Marks" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>

<div class="form-group">
                <label class="col-xs-3 control-label">Marks in Class 10: </label>
                <div class="col-xs-5">
               <input type="text" class="form-control" style="max-width: 300;"id="marks10" pattern = "^([1-9][0-9]{0,1}(\.[\d]{1,2})?|100)$" data-error = "please enter valid marks" name = "marks10" placeholder="Class10 Marks" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>
  </div>
 <div class="tab-pane" id="tabs-3">
            <div class="form-group">
                <label class="col-xs-3 control-label" required>Skills:</label>
                     <label class="checkbox-inline"><input type="checkbox" value="Java" name="skills">JAVA</label>
                    <label class="checkbox-inline"><input type="checkbox" value="Testing" name="skills">Testing</label>
                    <label class="checkbox-inline"><input type="checkbox" value="PL/SQL" name="skills">PL/SQL</label>
                    <label class="checkbox-inline"><input type="checkbox" value="Banking" name="skills">Banking</label>
             <div class = "help-block with-errors"></div>
                </div>
                
                 <div class="form-group">
                <label class="col-xs-3 control-label">Job Title: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control" style="max-width: 300;" id="jobTitle" name = "jobTitle" pattern = "[A-Za-z]+"data-error = "please enter valid title"placeholder="Enter job title" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>
            
             <div class="form-group">
                <label class="col-xs-3 control-label">Job Description: </label>
                <div class="col-xs-5">
                <textarea class="form-control"  style="max-width: 300;"  name = "jobDescription" pattern = "[A-Za-z]+" data-error="This is required field" required ></textarea>
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
                 <select class="form-control" style="max-width: 300;" name="constraintLocation" onchange='Check(this.value);' required>
                        <option value="">select</option>
                        <option value="Hyderabad">Hyderabad</option>
                        <option value="Chennai">Chennai</option>
                        <option value="Bangalore">Bangalore</option>
                        <option value = "Mumbai">Mumbai</option>
                        <option value = "Others">Others</option>
                 </select>
               </div>
             <div class = "help-block with-errors"></div>
           </div>            
            <div class="form-group">
                <label class="col-xs-3 control-label">Number of positions: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control" style="max-width: 300;"id="numberOfPositions" name = "numberOfPositions" pattern = "^[1-9]+[0-9]*" data-error = "please enter valid number of positions" placeholder="Enter number of positions" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-xs-3 control-label">Compensation: </label>
                <div class="col-xs-5">
                <input type="text" class="form-control"  style="max-width: 300;" id="compensation" name = "compensation" pattern = "^[1-9]+[0-9]*" data-error = "please enter valid compensation" placeholder="Enter compensation" required>
                <div class = "help-block with-errors"></div>
                </div>
            </div>
            
            </div>
         <div class="tab-pane" id="tabs-4">
              <div class="form-group">
                <label class="col-xs-3 control-label">Bond Agreement Details: </label>
                <div class="col-xs-5">
                <textarea class="form-control" style="max-width: 300;" id = "bondDetails" name = "bondDetails" required></textarea>
                <div class = "help-block with-errors"></div>
                </div>
            </div>
            
             <div class="form-group">
                <label class="col-xs-3 control-label">Bond Duration: </label>
                <div class="col-xs-5">
                 <select class="form-control"  style="max-width: 300;"name="bondDuration" required>
                        <option value="">select months</option>
                        <option value="12">12</option>
                        <option value="18">18</option>
                        <option value="24">24</option>
                        <option value="36">36</option>
                  </select>
                <div class = "help-block with-errors"></div>
                </div>
            </div>
            </div>
            <div class="tab-pane" id="tabs-5">
                <div class="form-group">
                <label class="col-xs-3 control-label">Certification: </label>
                <div class="col-xs-5">
                 <select class="form-control" style="max-width: 300;" name="certification" required>
                        <option value="">select</option>
                        <option value="NotApplicable">Not Applicable</option>
                        <option value="Applicable">Applicable</option>
                        <option value="Specific">Specific</option>
                 </select>
               </div>
             <div class = "help-block with-errors"></div>
           </div>
           <div class="form-group">
               <label for = "specialConditions" class = "col-xs-3 control-label">Special Conditions:</label>
               <div class="col-xs-5">
               <textarea class="form-control"  style="max-width: 300;" style = "height: 134px; width: 500px;" name = "specialConditions" required></textarea> 
               <div class = "help-block with-errors"></div>  
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
<table align = "center">
  <tr>
  <input type="hidden" name="partner_id" value="<%= request.getParameter("partner_id")%>"/>
    <input type="hidden" name="contact_id" value="<%= request.getParameter("contact_id")%>"/>
    
<!--   				<td><h3 align="left"><button type="submit" class = "btn btn-success">Submit and Broadcast</button></h3></td> -->
  				<td><h3 align="right"><button type="submit" class = "btn btn-success">Submit and Broadcast later</button></h3></td>
    </tr>
    </div>
    </table>
</form>
<br>
<br>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>
</html>