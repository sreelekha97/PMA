<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
targets: [ 8 ],
orderData: [ 8, 0 ]
} ]
} );
} );
</script>
</head>
<body>
<jsp:include page = "layout.jsp"></jsp:include>
<h1 align ="center"><font color="Orange">UPLOAD PARTNER IN BULK</font></h1><br>
<form action = FileUploadController method="post" enctype="multipart/form-data">
<center>
<input type="file" name="file1" size="60" data-error = "Select a file to upload" required /> 
<button type="submit" class="btn btn-success" >Upload File<span class="glyphicon glyphicon-open"></button>
</center>
</form>
<%  String msg = request.getParameter("msg");
    if(msg != null) {    
    	String duplicates = request.getParameter("duplicates");
        int success = Integer.parseInt(request.getParameter("success"));
        int failed = Integer.parseInt(request.getParameter("fail"));
    	out.println(msg+"<br><br>");
    	out.println(success+failed+" records of partner<br>");
    	out.println(success + " records inserted successfully<br>");
    	out.println(failed+" records failed to add<br>");
    	if(failed > 0) {
        	for(String dup:duplicates.split(",")) {
        		out.println(dup);
    	    }
        }
    }
%>
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>
</html>