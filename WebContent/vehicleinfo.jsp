<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="windowsup.*"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta http-equiv="Refresh" content="4">
	
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<link rel="stylesheet" href="css/st.css">
<link rel="stylesheet" href="css/drawer.css">

</head>
<body>
<%!All_Retriving_Methods m=new All_Retriving_Methods(); %>
<% if(session.getAttribute("subscriber_id")==null){
	response.sendRedirect("index.jsp");
}
%>
	<div id="my-navbar">								<!-- Drawer Container -->
    <div class="container-fluid ">
			<div class="row row2">
				<div class="col-xs-2" style="margin-top: 2px;">
					<h3 style="margin: 0px; margin-right: 10px;">
					<span class="smallnav menu" onclick="openNav()">
						 <span style="margin-top: 15px; margin-right: 2px; margin-left: 5px;"
							class="glyphicon glyphicon-menu-hamburger"></span>
					</span>	
					</h3>

				</div>
				<div class="col-xs-8"><span class="smallnav menu" onclick="openNav()"><h3> WindowsUp</h3></span></div>
				<div class="col-xs-2">
					<h4>
						<span
							style="margin-top: 5px; margin-right: 2px; margin-left: 5px;"
							class="glyphicon glyphicon-option-vertical"></span>
					</h4>
				</div>

			</div>
		</div>
</div>
	<div id="mySidenav" class="sidenav">
		<div class="container"
			style="background-color: #2874f0; padding-top: 10px;">
			<img class="profile-img " src="Img/sample.jpg" alt="Img"> 
			 <center> <span class="sidenav-heading">User Name</span>	</center>
			<!-- USER NAME HERE -->
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><span
				class="glyphicon glyphicon-menu-left"></span> </a>
		</div>

		<ul class="nav nav-pills nav-stacked nav-info">
			<li><a 
				href="notifications.jsp">Home</a></li>

			<li><a href="#">Profile</a></li>

			<li><a href="#">Setting</a></li>

			<li><a href="#">Past </a></li>

			<li class="nav-divider"></li>
			<li class="alert-danger"><a href="#"><div class="text-danger">Logout</div> </a></li>
			<li class="nav-divider"></li>

		</ul>
	</div>


	<div class="container-fluid">
		<!-- NavBar Container -->
		<div class="row">
			<div class="col-md-4 col-xs-0"></div>
			<div class="col-md-12  col-xs-12">
				<ul class="navbar-default nav nav-pills  ">
					<li style="float: left;" class="active"><a href="vehicles.jsp">Vehicles</a></li>
						<li style="margin-left: 13%;" ><a href="notifications.jsp">Notifications 
						<% 
						int UnReadMessages=m.getUnRead_Messages((int) session.getAttribute("subscriber_id")); 
						if(UnReadMessages>0){
						%>
						<span class="badge" style="background-color: #5cb85c; color: #fff;"><%=UnReadMessages %></span>
						<%}
						
						%>
						</a>
					</li>
					<li style="float: right;"><a href="permits.jsp">Permits</a></li>
				</ul>
			</div>
			<div class="col-md-4 col-xs-0"></div>
			<br> <br>
		</div>
		<!-- ROW 1 -->
	</div>
	<!--  ***************************************************** LEave ABove COde**************************************************** -->

						<%
						String rfid=(request.getParameter("rfid")); 
						String regno=request.getParameter("regno");
						String desc=request.getParameter("desc");
						int rfidno=Integer.parseInt(rfid);
						%>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-xs-0">
				<!-- COL 1 -->
			</div>
			<div class="col-md-4 col-xs-12">
				<!-- COL 2 -->
				<div class="panel">
					<center>
						<div class="panel-heading">
							<img class="profile-img " src="AddVehicle?id=<%=rfid%>" alt="Img">
						</div>
					</center>
					
					<form action="RemoveVehicle" method="post" id="removeform">
						<input type="hidden" name="rfidno" value="<%=rfidno%>">
						<div class="input-group">
							<button type="button" class="btn btn-lg btn-danger " id="rmvbtn"
								onclick="rmvvehicle();" style="margin-left: 3.1in;">
								<span class="glyphicon glyphicon-trash"></span>
							</button>
						</div>
					</form>
					
					<div class="panel-body ">
						
						<ul class="nav nav-pills nav-stacked nav-info">
							<li role="presentation"><a>RFID No &emsp;&emsp;&emsp;:&emsp;<%=rfid%></a></li>
							<li role="presentation"><a>Registration No:&emsp;<%=regno%></a></li>
							<li role="presentation"><a>Description &emsp;&nbsp;&nbsp;:&emsp;<%=desc %></a></li>
						</ul>
						
					</div>
				</div>

			</div>
		</div>
		<div class="col-md-4 col-xs-0">
			<!-- COL 3 -->
		</div>
	</div>
	</div>


	<script type="text/javascript">
	function rmvvehicle() {
		var status="<%=m.checkVehicleIfParked(rfidno)%>";
		
		if(status=="Yes"){
			alert("Vehicle Cannot Be Removed !!! \n As It's Parked...");
		}else{
			if(confirm('Are you sure you want to Remove This Vehicle ?')){
			document.getElementById("removeform").submit();
			}else{
				
			}
		}
	}
	
	</script>

	<script type="text/javascript">
function openNav() {
    document.getElementById("mySidenav").style.width = "70%";
    // document.getElementById("flipkart-navbar").style.width = "50%";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.body.style.backgroundColor = "rgba(0,0,0,0)";
}

</script>
	

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/index.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>