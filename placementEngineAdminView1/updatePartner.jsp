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
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/start/jquery-ui.css" rel="Stylesheet" type="text/css" />
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
</head>
<body>
<jsp:include page = "layout.jsp"></jsp:include>
<div id = "container">

<%
long id = Long.parseLong(request.getParameter("Id"));
String name = request.getParameter("Name");
String website = request.getParameter("Website");
String city = request.getParameter("City");
String address = request.getParameter("Address");
String description = request.getParameter("Description");
session.setAttribute("P", id);
/* out.print(id);
out.print(name);
out.print(website); */     
 PartnerPojo pp = new PartnerPojo(id,name,website,city,address,description);
 PartnerDAO pdao = new PartnerDAO();
  ArrayList<PartnerPojo> alc = pdao.getUpdateDetails(id);
  Iterator<PartnerPojo> itr = alc.iterator();	
  PartnerPojo cb = itr.next();
 long Partner_id = cb.getPartner_id();
  String Name = cb.getName();
String Website =cb.getWebsite();
  String City =cb.getCity();
  String Address = cb.getAddress();
String Description = cb.getDescription();
System.out.println(Description+"qwertyuiop  op");
%>

<form method="post" data-toggle="validator" action="UpdatePartnerController">
<h1 align ="center"><font color="orange">UPDATE PARTNER</font></h1><br>
<input class="form-control" id="name" type="hidden" name="Partner_id" value="<%=Partner_id%>" >
 <div class="form-group">
<label for="name"><h4>Name</h4></label>
<input class="form-control" id="name" type="text" name="Name" data-eror="This is required field" value="<%=Name%>" required autofocus> 
<div class = "help-block with-errors"></div>
</div>
 <div class="form-group">
<label for="website"><h4>Website</h4></label>
<td colspan="2"> <input class="form-control" id="website" type="text" name="Website" pattern="www.+.com" data-error = "The valid format for website :www.example.com" value="<%=Website%>" pattern="www.+.com"required></td>
<div class = "help-block with-errors"></div>
</div>
 <div class="form-group">
<label for="city"><h4>City</h4></label>
<input class="form-control" id="city" type="text" name="City"data-eror="This is required field" value="<%=City%>" required>
<div class = "help-block with-errors"></div>
</div>
 <div class="form-group">
<label for="address"><h4>Address</h4></label>
<input class="form-control" id="address" type="text" name="Address"data-eror="This is required field" value="<%=Address%>" required>
<div class = "help-block with-errors"></div>
</div>
 <div class="form-group">
<label for="description"><h4>Description</h4></label>
<textarea rows = "5" cols= "10"class="form-control" id="description" name="Description" data-eror="This is required field" required><%=Description%></textarea>
<div class = "help-block with-errors"></div>
</div>
<h3 align="center"><button type="submit" name="add" class="btn btn-success">Update Partner <span class='glyphicon glyphicon-pencil'></button></h3>
</div>
</form>
<align = "center"><jsp:include page = "contactView.jsp"></jsp:include></align>
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