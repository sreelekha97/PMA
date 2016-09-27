<%@page import="java.util.Iterator"%>
<%@page import="com.ts.demand.pojo.PartnerPojo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ts.demand.partner.dao.PartnerDAO"%>
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
 <title>Select Partner</title>
</head>
<body>
<jsp:include page = "layout.jsp"></jsp:include>
<!-- <div id="header">
    <h1><a href="home.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt="talentsprint" style="width:6%; float="left">
    </a></h1>
</div> -->

    <div id="section">

<%
    PartnerDAO pdao = new PartnerDAO();
    ArrayList<PartnerPojo> partnerList = pdao.getAllPartners(); 
    Iterator iter = partnerList.iterator();
%>

 <br><br>
 <h1 align ="center"><font color="Orange">SELECT A PARTNER</font></h1><br>
 
 <div class="table" align = "center">
  <table id = "keywords" class = "table">
  <thead>
    <tr>
      <th>Partner Name <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
      <th>City <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
      <th>Select </th>
      <th></th>
    </tr>
  </thead>
  <tbody>
  <%
  while(iter.hasNext()) {
	  PartnerPojo partpojo = (PartnerPojo)iter.next();
  %>
   <tr>
     <td><%=partpojo.getName() %></td>
     <td><%=partpojo.getCity() %></td>
     <td>
     <form action="DemandContactView.jsp" method="post">
         <input type="hidden" value="<%=partpojo.getName() %>" name="partner_name"/>
         <input type="hidden" value="<%=partpojo.getPartner_id() %>" name="partner_id"/>
<!--          <input type="submit" class="btn btn-success" value="Select Partner"/>
 -->    
       <button  class = "btn btn-success">Select Partner <span class="glyphicon glyphicon-ok"></button>
 
  </form>
     </td>
   </tr>
   <%
  }
   %>
  </tbody>
 </table>
 </div>
 </div>

<div id = "footer">
<jsp:include page = "UIFooter.jsp"></jsp:include></div>
</body>
</html>