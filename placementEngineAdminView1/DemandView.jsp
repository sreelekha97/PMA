<%@page import="com.ts.demand.pojo.DemandPojo"%>
<%@page import="com.ts.demand.pojo.TraineeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ts.demand.partner.dao.DemandDAO"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src = https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css> </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src = "https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
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
        }]
    });
    });
    </script>
    
    
</head>
<body>
<jsp:include page = "layout.jsp"></jsp:include>
<!--  <div id="header">
    <h1><a href="home.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt="talentsprint" style="width:6%; float="left">
    </a></h1>
</div>-->
<center>
<br><br>
<h1 align ="center"><font color="Orange">DEMAND LIST</font></h1><br>
<a href="DemandPartner.jsp" class = "btn btn-success">Create new demand <span class="glyphicon glyphicon-plus"></span></a>
</center>
  <br><br>
  <!-- Search:<input type = "text"  class = "form-control" style = "height: 30px;width: 200px;"/>-->
  <div class="table" align = "center">
  <table id="keywords" class = "table">
   <thead>
    <tr>
      <th>Partner</th>
      <th>Demand </th>
      <th>Created </th>
      <th>End </th>
      <th>Status</th>
      <th>BroadCast</th>
      <th>Add</th>
      <th>Download</th>
      <th>Cancel</th>
   </tr>
</thead>
    <%
DemandDAO ddao = new DemandDAO();
ArrayList<DemandPojo> demandList = ddao.listAllDemands(); 
for(DemandPojo dempojo : demandList) {
{
%>
<tr>
      <td><%=dempojo.getPartner_Name() %></td>
      <td>
      <form action="#" method="post">
      <input type="hidden" value="<%=dempojo.getDemand_id() %>" name="demandId">
      <input type="hidden" value="<%=dempojo.getPartner_id() %>" name="partner_id">
      <input type="hidden" value="<%=dempojo.getContact_id() %>" name="contact_id">
      <input type="submit" value="<%=dempojo.getRef_id() %>" class="btn-link name-link" style="color:black;text-decoration:none;">
      </form>
      </td>
      <td><%=dempojo.getCreatedDate() %></td>
      <td><%=dempojo.getEndDate() %></td>
      <% if(dempojo.getActive() == true) {%>
          <td><%= "Active" %></td>
      <%} else {%>
          <td><%= "Inactive" %></td>
      <%} %>
      <td>
      <form action="broadcastemails" method="post">
      <input type="hidden" value="<%=dempojo.getDemand_id() %>" name="demand_id">
      <button class = "btn btn-success">Broadcast <span class="glyphicon glyphicon-envelope"></span></button>
      </form>
      </td>
      <td>
       <a href = "AddTraineeToDemand.jsp?demand_id=<%=dempojo.getDemand_id() %>">Add Trainee</a></td>
      <td><a href="downloadeligibletrainee?demand_id=<%=dempojo.getDemand_id()%>">Download</a></td> 
      <td>
      <form action="deletedemand" method="post">
      <input type="hidden" value="<%=dempojo.getDemand_id() %>" name="demand_id">
      <button class = "btn btn-danger" onclick = "return alertName()">Cancel <span class="glyphicon glyphicon-remove"></span></button>
      </form>
      </td>
</tr>
<%
}
}
%>
</table>
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