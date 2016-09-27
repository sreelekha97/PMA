<%@page import="com.ts.demand.pojo.DemandPojo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ts.demand.partner.dao.DemandDAO"%>
<%@page import="com.ts.demand.pojo.PartnerPojo"%>
<%@page import="com.ts.demand.pojo.ContactPojo"%>
<%@page import="com.ts.demand.partner.dao.ContactDAO"%>
<%@page import="com.ts.demand.partner.dao.PartnerDAO"%>
<%@page import="java.util.Iterator"%>

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

    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/start/jquery-ui.css"

          rel="Stylesheet" type="text/css" />
<style>
       .form-group.required .control-label:before{ 
   content:"*";
   color:red;
}
    

    </style>

    

    

   <script>

    $(document).ready(function() {

    $('#example').DataTable( {

        columnDefs: [ {

            targets: [ 0 ],

            orderData: [ 0, 1 ]

        }, {

            targets: [ 2 ],

            orderData: [ 2, 0 ]

        }, {

            targets: [ 4],

            orderData:[ 4, 0 ]

        }]

    });

    });

    

    
    </script>

</head>

<body>
<jsp:include page = "layout.jsp"></jsp:include>


   



    <%




  




    String partner_id =  request.getParameter("partner_id");




    String Name =  request.getParameter("Name");




    String popup = request.getParameter("popup");




    PartnerPojo c = new PartnerPojo();




    String name = c.getName();




    System.out.println("aishu"+name+partner_id+popup);













%>













<div class ="mytable"  >

<div class="well">

  <form data-toggle="validator" action="AddContactController" method="post" class = "form-horizontal">




<h1 align ="center"><font color="Orange">Add Contact For <%=Name%></font></h1><br>




<input class="form-control" id="name" type="hidden" name="partner_id" value="partner_id">




<div class="form-group required">
<div class = "col-xs-5">
<label class=' control-label'>


<label for="name"><h4>Name :</h4></label>
</label>



<input class="form-control" id="name" type="text" name="name" data-error = "This field is required"required autofocus>

<div class = "help-block with-errors"></div>

</div>
</div>


<div class="form-group">
<div class = "col-xs-5">

<label for="title"><h4>Title :</h4></label>




<input class="form-control" id="title" type="text" name="title" >

<div class = "help-block with-errors"></div>

</div>
</div>



<div class="form-group required">

<div class = "col-xs-5">
<label class='control-label'>

<label for="email"><h4>E-mail :</h4></label>

</label>


 <input class="form-control" id="email" type="email" name="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" data-error = "The required format should be example@xyz.com"required>

<div class = "help-block with-errors"></div>

</div>
</div>

<div class="form-group required">

<div class = "col-xs-5">
<label class='control-label'>

<label for="phone"><h4>Phone :</h4></label>
</label>



<input class="form-control" id="phone" type="text" name="phone" pattern  = "^[789]\d{9}$" data-error = "The required format should be:9999999999" required>







<div class = "help-block with-errors"></div>

</div>
</div>

<div class="form-group">




<label for="city"><h4>City :</h4></label>







<!-- <td colspan="2"> <input class="form-control" id="city" type="text" name="city" required> -->




 <td>




  <!-- <div class="dropdown">




    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown




    <span class="caret"></span></button>




    <ul class="dropdown-menu">




      <li><a href="#">HTML</a></li>




      <li><a href="#">CSS</a></li>




      <li><a href="#">JavaScript</a></li>




      <li><a id = "shows" onclick = "other();">OTHER</a></li>




      </ul>




     




   




  </div> 




   -->




 <!--  




  <select name = "city">




   <option></option>




   <option value="Hyderabad">Hyderabad</option>




   <option value="Chennai">Chennai</option>




   <option value="Bangalore">Bangalore</option>




   <option value="Mumbai">Mumbai</option>




   <option value="Delhi">Delhi</option>




   <option value="Kolkata">Kolkata</option>




   <option value="Jaipur">Jaipur</option>




   <option value="Lucknow">Lucknow</option>




   <option value="Bhopal">Bhopal</option>




   <option value="Patna">Patna</option>




   <option value="Shimla">Shimla</option>




   <option value="Vellore">Vellore</option>




   <option value="Ahmedabad">Ahmedabad</option>




   <option value="Pune">Pune</option>




</select> 




   -->
<script type="text/javascript">
function Check(val){
 var element=document.getElementById('city');
 if(val=='others'){
   element.style.display='block';
 }
 else  {
   element.style.display='none';
   document.getElementById('city').value = val;
 }
}
</script> 
</head>
<body>
  <select name="dropdown" onchange='Check(this.value);'> 
  <option value=" "> </option>
   <option value="Hyderabad">Hyderabad</option>
   <option value="Chennai">Chennai</option>
   <option value="Bangalore">Bangalore</option>
    <option value="others">others</option>
  </select>
<input type="text" name="city" id="city" style='display:none;'/>
 </div>
 <input type = "hidden" name ="result" value =<%=partner_id%>>
<input type = "hidden" name ="popup" value =<%=popup%>>
<input type = "hidden" name ="Name" value =<%=Name%>>
<h3 align="center"><button type="submit" name="add" class="btn btn-success" onclick="myFunc()">Add Contact <span class="glyphicon glyphicon-plus"></button></h3>
</form>
</div>
</div>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
<script type = "text/javascript">
    function alertName(){




	if(confirm("Do you want to delete")) {}




	else {




		return false;




	}




}




</script>




</body>




</html>