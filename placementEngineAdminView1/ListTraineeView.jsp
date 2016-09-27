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
    <link rel="stylesheet" type="text/css" href="style.css">
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
<div class = "table" align = "center">
<table id = "example" class="table">
<br>
<H1><font color = "Orange">TRAINEE LIST</font></H1>
<a href = "addTrainee.jsp" class="btn btn-success" style="margin-right: 7px;">Add Trainee<span class="glyphicon glyphicon-plus"></span></a>
<a href = "Upload.jsp" class="btn btn-success" style="margin-right: 7px;">Upload Trainee List in Bulk <span class="glyphicon glyphicon-open"></span></a>
<a href="DownloadTrainee" class="btn btn-success" style="margin-right: 7px;">Download Trainee List<span class="glyphicon glyphicon-download-alt"></span></a><br><br>



<thead>
<tr>
<th>Name </th>
<th>TraineeId </th>
<th>Email </th>
<th>Status</th>
</tr>
</thead>
<%
try{

	TraineeDAO tdao = new TraineeDAO();
	ArrayList<TraineeBean> list = tdao.listTrainee();
    ListIterator<TraineeBean> lt = list.listIterator();
   
while(lt.hasNext()){
	TraineeBean tb = lt.next();
	out.print("<tr>");
	out.print("<td>" + tb.getName() + "</td>");
    out.print("<td>" + tb.getTraineeid() +"</td>");
	out.print("<td>" + tb.getEmail()+"</td>");
	if(tb.isActive() == true) 
    	out.print("<td> Active </td>");
	else 
		out.print("<td> Inactive </td>");
	%>
	<td>
	<form action = "Update.jsp" method = "post">
	    <input type="hidden" value="<%= tb.getName() %>" name="name" />
	    <input type="hidden" value="<%= tb.getCertification() %>" name="certification" />
	    <input type="hidden" value="<%= tb.getBatch() %>" name="batch" />
	    <input type="hidden" value="<%= tb.getComgrade() %>" name="comgrade" />
	    <input type="hidden" value="<%= tb.getEmail() %>" name="email" />
	    <input type="hidden" value="<%= tb.getGender() %>" name="gender" />
	    <input type="hidden" value="<%= tb.getCname() %>" name="cname" />
	    <input type="hidden" value="<%= tb.getLgrad() %>" name="lgrad" />
	    <input type="hidden" value="<%= tb.getMarks10() %>" name="marks10" />
	    <input type="hidden" value="<%= tb.getMarks12() %>" name="marks12" />
	    <input type="hidden" value="<%= tb.getMarkspg() %>" name="markspg" />
	    <input type="hidden" value="<%= tb.getMarksug() %>" name="marksug" />
	    <input type="hidden" value="<%= tb.getMobile() %>" name="mobile" />
	    <input type="hidden" value="<%= tb.getPgrade() %>" name="pgrade" />
	    <input type="hidden" value="<%= tb.getSkill() %>" name="skill" />
	    <input type="hidden" value="<%= tb.getTgrade() %>" name="tgrade" />
	    <input type="hidden" value="<%= tb.getTraineeid() %>" name="traineeid" />
	    <input type="hidden" value="<%= tb.getVerify() %>" name="verify" />
	    <input type="hidden" value="<%= tb.getAgrade() %>" name="agrade" />
	    <input type="hidden" value="<%= tb.getVfrom() %>" name="vfrom" />
	    <input type="hidden" value="<%= tb.getVto() %>" name="vto" />
	    <input type="hidden" value="<%= tb.getClocation() %>" name="clocation" />
	    <input type="hidden" value="<%= tb.getDob() %>" name="dob" />
	    <input type="hidden" value="<%= tb.getReason() %>" name="reason" />
	    <input type="hidden" value="<%= tb.getYgrad() %>" name="ygrad" />
	    <input type="hidden" value="<%= tb.getYinter() %>" name="yinter" />
	    <input type="hidden" value="<%= tb.getYssc() %>" name="yssc" />
	    <input type="hidden" value="<%= tb.isActive() %>" name="active" />
	    <button type="submit" class="btn btn-success"> Show More details<span class="glyphicon glyphicon-pencil"></span></button>
	</form>
	</td>
	<%
/* 	out.println("<td><a href=Update.jsp?name="+tb.getName()+"&batch="+tb.getBatch()+"&traineeid="+tb.getTraineeid()+"&gender="+tb.getGender()+"&email="+tb.getEmail()+"&dob="+tb.getDob()+"&mobile="+tb.getMobile()+"&cname="+tb.getCname()+"&clocation="+tb.getClocation()+"&lgrad="+tb.getLgrad()+"&ygrad="+tb.getYgrad()+"&yinter="+tb.getYinter()+"&yssc="+tb.getYssc()+"&markspg="+tb.getMarkspg()+"&marksug="+tb.getMarksug()+"&marks12="+tb.getMarks12()+"&marks10="+tb.getMarks10()+"&skill="+tb.getSkill()+"&certification="+tb.getCertification()+"&comgrade="+tb.getComgrade()+"&tgrade="+tb.getTgrade()+"&pgrade="+tb.getPgrade()+"&agrade="+tb.getAgrade()+"&active="+tb.isActive()+"&reason="+tb.getReason()+"&vfrom="+tb.getVfrom()+"&vto="+tb.getVto()+"&verify="+tb.getVerify()+" class='btn btn-success'> Show more details <span class='glyphicon glyphicon-pencil'></a></td>"); */
}

}catch(Exception ex){
	ex.printStackTrace();
}
%>
    </table>
	
	</div>
	



<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>
</html>