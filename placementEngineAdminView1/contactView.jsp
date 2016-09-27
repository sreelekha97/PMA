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

            targets: [ 4 ],

            orderData: [ 4, 0 ]

        }]

    });

    });

    </script>

</head>

<body>


<% 

long partner_id = Long.parseLong(request.getParameter("Id"));




String p_name = request.getParameter("Name");

 ContactDAO cdao = new ContactDAO();

 System.out.println("contactview"+p_name);

/* int partner_id = Integer.parseInt(request.getParameter("partner_id")); */




 ArrayList<ContactPojo> alc = cdao.getAllContacts(partner_id);




 Iterator<ContactPojo> itr = alc.iterator();

%>

<div id = "section" >

<h1 align ="center"><font color="orange"><%=p_name%>-Contact List</font></h1>




<h1 align="center"><a href = "addContact.jsp?partner_id=<%=partner_id%>&Name=<%=p_name%>" class="btn btn-success">Add Contact <span class="glyphicon glyphicon-plus"></button></a></h1>




<div class = "table" align = "center">

<table id = "keywords" class = "table">




<thead> 

<tr>

				<td><b>Name</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				<td><b>Title</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				<td><b>Email</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				<td><b>Phone</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				<td><b>City</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




</tr>

</thead>

<% while(itr.hasNext()) {




               ContactPojo cb = itr.next(); %>




                <tr>




                <% long contact_id = cb.getContact_id(); 




                String name = cb.getName();




                String title =cb.getTitle();




                String email = cb.getEmail();




                String phone = cb.getPhone();




                String city = cb.getCity();




                  partner_id = cb.getPartner_fk();  




                %>




               <%--  <td><%=contact_id%></td> --%>




                <td><%=name%></td>




                <td><%=title%></td>




                <td><%=email%></td>




                <td><%=phone%></td>




                <td><%=city%></td>




               <%--  <td><%=partner_id%></td> --%>




               <td><a href=updateContact.jsp?Cid=<%=contact_id%>&Name=<%=name%>&Title=<%=title%>&Email=<%=email%>&Phone=<%=phone%>&City=<%=city%>&Pid=<%=partner_id%> class="btn btn-success">Update <span class='glyphicon glyphicon-pencil'></button></a></td>




               </tr>

 <%                           

            }

%>

</table>

</div>

</div>

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