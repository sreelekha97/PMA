<%@page import="com.ts.demand.partner.dao.DriveDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
<script>
$(document).ready(function(){
    $("#hides").hide();
    $("input:checkbox").on('click', function() {
  	  // in the handler, 'this' refers to the box clicked on
  	  var $box = $(this);
  	  if ($box.is(":checked")) {
  	    // the name of the box is retrieved using the .attr() method
  	    // as it is assumed and expected to be immutable
  	    var group = "input:checkbox[name='" + $box.attr("name") + "']";
  	    // the checked state of the group/box on the other hand will change
  	    // and the current value is retrieved using .prop() method
  	    $(group).prop("checked", false);
  	    $box.prop("checked", true);
  	  } else {
  	    $box.prop("checked", false);
  	  }
  	});
    $("#shows").click(function(){
        $("#hides").show();
    });
});
</script>
<script>
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
 <%
//String drive_name = request.getParameter("drive_name");
String error = request.getParameter("error");
String demand = request.getParameter("demand");
System.out.println(demand);
DriveDAO dDAO = new DriveDAO();
String drive_name=dDAO.getDriveName(demand);
%>
<%
if(error != null){
	out.println("<script type = \"text/javascript\">");
    out.println("alert('please select any one checkbox');");
    //out.println("location='addDrive.jsp?demand="+demand+";");
    out.println("</script>");
}

%>
<div class="container">
<div class="row">
<div class="col-sm-6 col-md-4 col-md-offset-4">
<br>
<FORM method = "post" action = "addDrive">
<br><br>
<h1 align ="center"><font color="Orange">ADD DRIVE</font></h1><br> 
<label for = "drive" >Title: </label>
<input type="text" name = "drive" class="form-control" value=<%=drive_name %> readonly required>
<br>
<label for = "round" >Rounds: </label><br>
  <input type="checkbox" name = "rounds" value="groupdiscussion">&nbsp;Group Disussion<br>
  <input type="checkbox" name = "rounds" value="hrinterview" >&nbsp;HR Interview<br>
  <input type="checkbox" name = "rounds" value="Internal communication evaluation" >&nbsp;Internal Communication Evaluation<br>
  <input type="checkbox" name = "rounds" value="Interview">&nbsp; Interview<br>
  <input type="checkbox" name = "rounds" value=" Technical Interview">&nbsp;Technical Interviews<br>
  <input type="checkbox" name = "rounds" value=" Written Test">&nbsp;Written Test<br>
  <input type="checkbox" name = "rounds" value = "other" id = "shows">&nbsp;Other
  <a id = "oname" ><input type = "textfield" id = "hides" name = "other"  ></a>
<br>
<button class="btn btn-lg btn-success" type="submit">Add Drive <span class="glyphicon glyphicon-plus"></span></button><br>
<input type = "hidden" name = "demand" value = <%=demand %>>
<input type = "hidden" name = "demand" value = <%=drive_name%>>
</div>
</div>
</FORM>
</div>
</div>
</div>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>
</html>