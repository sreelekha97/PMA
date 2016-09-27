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





<div id="section">




    <a href = "partnerView.jsp"><br><button type="button" name="back" class="btn btn-success">BACK</button></a>







<div class="well">

  <form data-toggle="validator" method="post" action="AddPartnerController">

<br><br>

<h1 align ="center"><font color="orange">Add Partner</font></h1><br>

 

   <div class="form-group">

<label for="name"><h4>Name :</h4></label>




<input class="form-control" id="name" type="text" name="name" data-eror="This is required field" required autofocus>

<div class = "help-block with-errors"></div>

</div>

<div class = "form-group">

<label for="website"><h4>Website :</h4></label>




<input class="form-control" id="website" type="text" name="website" pattern="www.+.[a-z]+" data-error = "The valid format for website :www.example.com"required>

<div class = "help-block with-errors"></div>




</div>

<div class = "form-group">

<label for="city"><h4>City :</h4></label>




<input class="form-control" id="city" type="text" name="city" data-error = "This field is required"required>

<div class = "help-block with-errors"></div>




</div>

<div class = "form-group">

<label for="address"><h4>Address :</h4></label>

<input class="form-control" id="address" type="text" name="address" data-error = "This field is required"required>

<div class = "help-block with-errors"></div>




</div>

<div class = "form-group">

<label for="description"><h4>Description :</h4></label>




<textarea rows = "5" cols= "10"class="form-control" id="description" name="description" data-error = "This field is required" required></textarea></td>

<div class = "help-block with-errors"></div>




</tr>




</table>




<input type = "hidden" name = "popup" id = "popup">
<h3 align="center"><button  type="submit" onclick = "myfunction()" name="add" class="btn btn-success">Add Partner<span class = "glyphicon glyphicon-plus"></span></button></h3>
</form>
</div>




</div>




  <script>




    function myfunction() {




    	var r = confirm("Do you want to add contact !");




    	if(r == true) {




    		document.getElementById("popup").value = true;




    	}




    	else 




    		document.getElementById("popup").value = false;




    	




    }




    </script>













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