<%@page import = "com.ts.demand.pojo.*"%>
<%@page import = "java.util.Iterator" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.ts.demand.partner.dao.ReportDAO"%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
     $(document).ready(function() {
    	    $('#keywords').DataTable( {
    	        columnDefs: [ {
    	            targets: [ 0 ],
    	            orderData: [ 0, 1 ]
    	        }, {
    	            targets: [ 1 ],
    	            orderData: [ 1, 0 ]
    	        }, {
    	            targets: [ 1 ],
    	            orderData: [ 1, 0 ]
    	        } ]
    	    } );
    	} );
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
 </script>
 <title>Select Report</title>
 
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
<li class = "a"><a href= "DemandView.jsp"><h4>Demand</font></h4></a></li>
<li class = "a"><a href= "DriveView.jsp"><h4>Drive</h4></a></li>
<li class = "a"><h4>Report</h4></li>
<li class = "p"><a href= "TraineeHistory.jsp"><h5>TraineeHistory</h5></a></li>
<li class = "p"><a href= "ListOfDrivesView.jsp"><h5>DrivesByCompany</h5></a></li>
<li class = "p"><a href= "#"><h5>SelectedTrainee</h5></a></li>
<li class = "p"><a href= "inactiveTraineeView.jsp"><h5>InactiveTrainee</h5></a></li>
</ul>
</div>

 <div id="section">
 
 <br><br><br>
 <form action = "PrintTraineeGrades.jsp" method = "post">>
 <h1 align ="center"><font color="Orange">Select The Report</font></h1><br>
 <br><br>
 <label for="grades" class = "control-label">Select the grade:</label>
	<select id="grades" name="grades" ">
	
        <option value="CG">Communication Grade</option>
        <option value="TG">Technical Grade</option>
        <option value="A">Project Grade</option>
        <option value="AG">Aptitude Grade</option>
       
    </select>
    <input type = "submit">
    </form>
    <script>
    function checkGrades() {
    	var select = document.getElementById("grades");
    	var selectedValue = select.value;
    	
    }
    
    </script>
   <%--  <%
    ReportDAO pdao = new ReportDAO();
    String val= request.getParameter("grades");
    if(val.equals("CG")){
    	ArrayList<TraineeBean> alc = pdao.GetTraineesGrade("comgrade");
		Iterator<TraineeBean> itr = alc.iterator();
    	
    }
    if(val.equals("PrG")){
    	ArrayList<TraineeBean> alc = pdao.GetTraineesGrade("pgrade");
		Iterator<TraineeBean> itr = alc.iterator();
    	
    }
    if(val.equals("TG")){
    	ArrayList<TraineeBean> alc = pdao.GetTraineesGrade("tgrade");
		Iterator<TraineeBean> itr = alc.iterator();
    	
    }
    if(val.equals("AG")){
    	ArrayList<TraineeBean> alc = pdao.GetTraineesGrade("agrade");
		Iterator<TraineeBean> itr = alc.iterator();
    	
    }
    
    %> --%>
    

  <!--  <script type = "text/javascript">
    ReportDAO pdao = new ReportDAO();
    function checkGrades(grade) {
    	if(grade.value == "CG"){
    		ArrayList<SelectedTrainee> alc = pdao.getTraineesGrade('comgrade');
    		 Iterator<SelectedTrainee> itr = alc.iterator();
    		
    	} else if(grade.value == "TG"){
    		ArrayList<SelectedTrainee> alc = pdao.getTraineesGrade('tgrade');
    		 Iterator<SelectedTrainee> itr = alc.iterator();
    	}else if(grade.value == "PrG"){
    	 ArrayList<SelectedTrainee> alc = pdao.getTraineesGrade('pgrade');
   		 Iterator<SelectedTrainee> itr = alc.iterator();
   		}
    	else{
    		ArrayList<SelectedTrainee> alc = pdao.getTraineesGrade('agrade');
    		 Iterator<SelectedTrainee> itr = alc.iterator();
    	}
    	
    }
  </script> -->
  
    
    </script>
 <div class="table">
 <table id = "example" class ="table"><br></br>
 <thead>
<tr>
                
                
                <td><b>Trainee Id</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>
                <td><b>Name</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>
                <td><b>Grade</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>
               
</tr>
</thead>


</table>
</div>
</form>
</div>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>
</html>