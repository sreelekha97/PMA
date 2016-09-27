<%@page import="com.ts.demand.pojo.ContactPojo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ts.demand.partner.dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<!-- <div id="header">
<h1><a href = "UIHome.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt = "talentsprint" style="width:6%; float = "left" ></a></h1>
</div> -->
<div id = "section">
 <br><br>
  <!-- Search:<input type = "text"  class = "form-control" style = "height: 30px;width: 200px;"/>-->
  <br><br>
  <h1 align ="center"><font color="Orange">CONTACT LIST</font></h1><br>
  
  <div class="table" align = "center">
  <table id = "keywords" class = "table">
   <thead>
    <tr>
      <th>Contact <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
      <th>Email <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
      <th>Phone <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
      <th>City <span id = "sort" class = "glyphicon glyphicon-sort"></span></th>
      <th>Select</th>
   </tr>
</thead>
<%
long partner_id = Long.parseLong(request.getParameter("partner_id"));
String partner_name = request.getParameter("partner_name");
ContactDAO ddao = new ContactDAO();
ArrayList<ContactPojo> contactList = ddao.getAllContacts(partner_id); 
for(ContactPojo conpojo : contactList) {
{
%>
<tr>
      <td><%=conpojo.getName() %></td>
      <td><%=conpojo.getEmail() %></td>
      <td><%=conpojo.getPhone() %></td>
      <td><%=conpojo.getCity() %></td>
      <td>
      <form action="AddDemandView.jsp" method="post">
      <input type="hidden" value="<%= partner_name%>" name="partner_name"/>
      <input type="hidden" value="<%=conpojo.getPartner_fk()%>" name="partner_id"/>
      <input type="hidden" value="<%=conpojo.getContact_id() %>" name="contact_id"/>
      <!-- <input type="submit" value="Select" class="btn btn-success" /> -->
      <button  class = "btn btn-success">Select <span class="glyphicon glyphicon-ok"></button>
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
</body>
</html>