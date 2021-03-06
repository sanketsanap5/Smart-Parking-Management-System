<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="windowsup.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
 <meta http-equiv="Refresh" content="3"> 

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<link rel="stylesheet" href="css/st.css">
<link href="css/table.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="css/drawer.css">
</head>
<body>

<input type="hidden" id="uname" value='<%=session.getAttribute("Email")%>'> <!-- for getting profile image -->

<% if(session.getAttribute("subscriber_id")==null || session==null){
	response.sendRedirect("index.jsp");
}
%>

<%!All_Retriving_Methods m=new All_Retriving_Methods(); %>
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
				<img class="profile-img " id="profile-photo" src="" alt="..."> 
				 <center> <span class="sidenav-heading">User Name</span>	</center>
			<!-- USER NAME HERE -->
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><span
				class="glyphicon glyphicon-menu-left"></span> </a>
		</div>

		<ul class="nav nav-pills nav-stacked nav-info">
			<li><a 
				href="notifications.jsp">Home</a></li>

			<li><a href="Edit_Profile.jsp">Profile</a></li>

			<li><a href="#">Setting</a></li>

			<li><a href="#">Past </a></li>

			<li class="nav-divider"></li>
			<li class="alert-danger dropdown"><a class="dropdown-toggle" data-toggle="dropdown" > LogOut</a>
				<div class="dropdown-menu">
					<div class="well text-info ">
					<p> Do You Confirm to LogOut?</p>
					<a class="text-center text-danger" style="padding-right:1cm;" href="#"><b>Yes</b>
					</a>
					<a class="text-center text-success" href="#"><b>No</b></a>
					</div>
				</div>
			</li>
			<li class="nav-divider"></li>

		</ul>
	</div>



<div class="container-fluid">						<!-- NavBar Container -->
	<div class="row"> 
			<div class="col-md-4 col-xs-0"></div>
			<div class="col-md-12 col-xs-12">
				<ul class="navbar-default nav nav-pills   ">
					<li style="float: left;"><a href="vehicles.jsp">Vehicles</a></li>
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
					<li style="float: right;" class="active"><a href="permits.jsp">Permits</a></li>
				</ul>
			</div>
			<div class="col-md-4 col-xs-0"></div>
			<br> <br>
	</div>	<!-- ROW 1 --> 
</div>	

<div class="container-fluid">		<!-- addPermit btn Container -->	
		<div class="row">
			<div class="col-md-10 col-xs-9"></div>
			<div class="col-xs-2 col-md-2">
				<div class=" navbar-fixed-bottom" style="margin-bottom: 15%;">
					<form name="someform" action="addpermit.jsp">
						<input type="image"  class="img-circle" value="submit" height="50"
							width="55"  style="margin-left: 75%; "
							src="Img/plusbtn.jpg" alt="submit Button"
							onMouseOver="this.src='Img/index.png">
					</form>
				</div>
			</div>
			<div class="col-md-0 col-xs-1"></div>
		</div>
	</div>



<!--  ***************************************************** LEave ABove COde**************************************************** -->


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-xs-0"></div>

			<div class="col-md-4 col-xs-12">
				<!-- table code starts -->

				<div class="widget stacked widget-table action-table">

					<div class="widget-content">

						<table class="table table-striped table-bordered table-hover  text-center">
							<thead>
								<tr class="info text-center">
									<td>Lot</td>
									<td>Floor-Slot</td>
									<td>Category</td>
									<td>Status</td>
								</tr>
							</thead>
							<tbody>
								<%
								ResultSet rs=null;
								int subscriber_id=(Integer) session.getAttribute("subscriber_id");
								rs=m.getPermits(subscriber_id);
								while(rs.next()){
								%>
							<tr>
								<td><%=rs.getString(1) %></td>
								<td><%=rs.getInt("parking_floor_id")+"-"+rs.getInt("parking_slot_id") %></td>
								<td><%=rs.getString("parking_category") %></td>
								<td><% if(rs.getString("permit_status").equalsIgnoreCase("Accepted")) {	
									%>
									<span class="label label-success">
									<% }else if(rs.getString("permit_status").equalsIgnoreCase("Declined")){
										%>
									<span class="label label-danger">	
										<% }else if(rs.getString("permit_status").equalsIgnoreCase("Pending")){ %>
										<span class="label label-warning">		
										<%} %>
										
										<%=rs.getString("permit_status") %>
										</span>
										
								</td>		
							</tr>

								<%} %>
							</tbody>
						</table>

					</div>


					<!-- Table code ends -->


				</div>

	<div class="col-md-4 col-xs-0"></div>
					<% m.Is_there_message(request, response); %>
			</div>

		</div>

	</div>


	<script type="text/javascript">
	function getPhoto() {
		var uname=document.getElementById("uname").value;
		document.getElementById("profile-photo").src="Get_Image_Profile.jsp?email="+uname;

	}

	window.onload=getPhoto;	
	
	
	
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