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

   

   <script>

    $(document).ready(function() {

    $('#keywords').DataTable( {

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
<!-- <div id="header">
    <h1><a href="home.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt="talentsprint" style="width:6%; float="left">
    </a></h1>
</div> -->

<% 
 PartnerDAO pdao = new PartnerDAO();
 ArrayList<PartnerPojo> alc = pdao.getAllPartners();
 Iterator<PartnerPojo> itr = alc.iterator();
%>
<div id = "section">

<div class="table" align = "center">
<table class = "table"  id = "keywords">
<center>

<h1 align ="center"><font color="orange">Partner List</font></h1>
<a href = "addPartner.jsp" class="btn btn-success">Add Partner <span class="glyphicon glyphicon-plus"></button></a></h1>
<a href = "uploadFile.jsp" class="btn btn-success">Upload Partner List in Bulk <span class="glyphicon glyphicon-open"></button></a></h1>
<a href ="DownloadPartner" class="btn btn-success">Download Partner List <span class="glyphicon glyphicon-download-alt"></button></a></h1> <BR>
<BR>
</center>
              <thead>
              <tr>
				<td><b>Name </td>				
				<td><b>Website </td>
				<td><b>City </td>
				<td><b>City-name-Contact</td>
				<!-- <td><b>Address</b></td>
				<td><b>Description</b></td> -->
				</tr>
			</thead>
 <% while(itr.hasNext()) {
                PartnerPojo cb = itr.next(); %>
                <tr>
                <% long partner_id = cb.getPartner_id(); 
                String name = cb.getName();
                String website =cb.getWebsite();
                String city =cb.getCity();
                String address = cb.getAddress();
                String description = cb.getDescription();
                %>
                <td><%=name%></td>
                <td><%=website%></td>
                <td><%=city%></td>
                <td><%
                ContactDAO cdao = new ContactDAO();
                ArrayList<ContactPojo> calc = cdao.getAllContacts(partner_id);
                Iterator<ContactPojo> citr = calc.iterator();
               while(citr.hasNext()) {
                ContactPojo cc = citr.next(); %>
                <%=cc.getCity()%> - <%=cc.getName()%> - <%=cc.getPhone()%> <br>
                        <% } %>            
        </td>
                <%-- <td><%=address%></td>
                <td><%=description%></td> --%>
                <td><a href=updatePartner.jsp?Id=<%=partner_id%>&Name=<%=name%>&Website=<%=website%>&City=<%=city%>&Address=<%=address%>&Description=<%=description%> class="btn btn-success">Update<span class='glyphicon glyphicon-pencil'></button></a></td>
                </tr>
   <%                            
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