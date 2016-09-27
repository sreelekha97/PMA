<%@page import = "com.ts.demand.pojo.TraineeBean"%>
<%@page import = "com.ts.demand.partner.dao.TraineeDAO"%>
<%@page import = "java.util.*"%>
<%@page import = "com.ts.demand.pojo.*"%>
<%@page import = "java.util.Iterator" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.ts.demand.partner.dao.*"%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src = https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css> </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src = "https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    
<script>
$(document).ready(function() {
    $('#example').DataTable( {
        columnDefs: [ {
            targets: [ 0 ],
            orderData: [ 0, 1 ]
        }, {
            targets: [ 1],
            orderData: [ 1, 0 ]
        }, {
            targets: [ 4],
            orderData: [ 4, 0 ]
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
<link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>
<jsp:include page = "layout.jsp"></jsp:include>
<!--<div id="header">
<h1><a href = "UIHome.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt = "talentsprint" style="width:6%; float = "left" ></a></h1>
</div>-->
<div id = "section">

<H1 align = "center"><font color = "Orange">ACCESSED TRAINEE</font></H1>
<br><br>
<div class = "table" align = "center">
<table id = "example" class="table">
<thead>
<tr>
<th>Name <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
<th>TraineeId <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
<th>Email <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
</tr>
</thead>
<%
try{
	 TraineeDAO tdao = new TraineeDAO();
	ArrayList<TraineeBean> list = tdao.AcessedTrainee();
    ListIterator<TraineeBean> lt = list.listIterator(); 
while(lt.hasNext()){
	TraineeBean tb = lt.next();
	out.print("<tr>");
	out.print("<td>" + tb.getName() + "</td>");
	out.print("<td>" + tb.getTraineeid() +"</td>");
	out.print("<td>" + tb.getEmail() +"</td>");
	
}
}catch(Exception ex){
	ex.printStackTrace();
}
%>
    </table>
	
	</div>
	
	<br>
	
	</div>
	
<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>
</html>
