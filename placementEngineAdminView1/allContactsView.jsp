<%@page import="com.ts.demand.partner.dao.ContactDAO"%>

<%@page import="com.ts.demand.pojo.*"%>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.ArrayList"%>

<%@page import="com.ts.demand.partner.dao.PartnerDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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

     #sort {

    	color: grey;

    }

    table {

    width:100%;

    }

    </style>

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

            targets: [ 5 ],

            orderData: [ 5, 0 ]

        }]

    });

    });

    </script>

</head>

<body>

<div id="header">

    <h1><a href="home.jsp"><img src="http://dashboard.talentsprint.com/images/talentsprintlogo.jpg" alt="talentsprint" style="width:6%; float="left">

    </a></h1>

</div>

<div id="nav">

<b>Menu</b><br>

<ul>

<li class = "a"><a href= "ListTraineeView.jsp"><h4>TraineeDetails</h4></a></li>
<li class = "a"><a href= "partnerView.jsp"><h4>Partner</h4></a></li>
<li class = "a"><a href= "DemandView.jsp"><h4>Demand</h4></a></li>
<li class = "a"><a href= "DriveView.jsp"><h4>Drive</h4></a></li>
<li class = "a"><h4>Report</h4></li>
<li class = "p"><a href= "TraineeHistory.jsp"><h5>TraineeHistory</h5></a></li>
<li class = "p"><a href= "ListOfDrivesView.jsp"><h5>DrivesByCompany</h5></a></li>
<li class = "p"><a href= "#"><h5>SelectedTrainee</h5></a></li>
<li class = "p"><a href= "inactiveTraineeView.jsp"><h5>InactiveTrainee</h5></a></li>

</ul>

</div>

<% 

 

 /* out.print(partner_id);  */

 ContactDAO cdao = new ContactDAO();




/* int partner_id = Integer.parseInt(request.getParameter("partner_id")); */




 ArrayList<ContactPojo> alc = cdao.getContacts();




 Iterator<ContactPojo> itr = alc.iterator();




  




%>




<div id = "section" >

<h1 align ="center"><font color="orange">CONTACT LIST</font></h1>




<div class = "table" align = "center">

<table id = "keywords" class = "table">




<thead> 

<tr>

                 




				<td><b>Partner Name</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>

				<td><b>Name</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				<td><b>Title</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				<td><b>Email</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				<td><b>Phone</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				<td><b>City</b> <span id = "sort" class = "glyphicon glyphicon-sort"></span></td>




				

</tr>

</thead>










<% while(itr.hasNext()) {




               ContactPojo cb = itr.next();

               

               

                             %>




                <tr>




                <%

                long partner_id = cb.getPartner_fk();




                long contact_id = cb.getContact_id(); 




                String name = cb.getName();




                String title =cb.getTitle();




                String email = cb.getEmail();




                String phone = cb.getPhone();




                String city = cb.getCity();

                

                




                  

                %>




               <%--  <td><%=contact_id%></td> --%>

               

               <td><% 

               

               PartnerDAO pdao = new PartnerDAO();

               ArrayList<PartnerPojo> palc = pdao.getPartnerName(partner_id);

               Iterator<PartnerPojo> pitr = palc.iterator();

               while(pitr.hasNext()) {

                   PartnerPojo pb = pitr.next();

                    

               

                              %><%=pb.getName()%><%} %></td>




                <td><%=name%></td>




                <td><%=title%></td>




                <td><%=email%></td>




                <td><%=phone%></td>




                <td><%=city%></td>




               <%--  <td><%=partner_id%></td> --%>




               




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