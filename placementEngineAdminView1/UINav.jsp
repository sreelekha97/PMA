<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
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
<style>
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
</style>
</head>
<div id="nav">
<b>Menu</b><br>
<ul>
<li class = "a"><a href= "ListTraineeView.jsp"><h4>Trainee Details</h4></a></li>
<li class = "a"><a href= "partnerView.jsp"><h4>Partner</h4></a></li>
<li class = "a"><a href= "DemandView.jsp"><h4>Demand</h4></a></li>
<li class = "a"><a href= "DriveView.jsp"><h4>Drive</h4></a></li>
<li class = "a"><a href = "#"><h4>Report</h4></li>
<li class  = "p"><a href= "TraineeHistory.jsp"><h5>Trainee History</h5></a></li>
<li class  = "p"><a href= "ListOfDrivesView.jsp"><h5>Drives By Company</h5></a></li>
<li class  = "p"><a href= "SelectedTrainee.jsp"><h5>Selected Trainee</h5></a></li>
<li class  = "p"><a href= "inactiveTraineeView.jsp"><h5>Inactive Trainee</h5></a></li>

</ul>

</ul>
</div>
</html>