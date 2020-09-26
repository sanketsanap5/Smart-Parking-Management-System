<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="windowsup.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 
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
<link rel="stylesheet" href="css/drawer.css">
<link rel="stylesheet" href="css/notify.css">
</head>
<body>
<input type="hidden" id="uname" value='<%=session.getAttribute("Email")%>'>



<% if(session.getAttribute("subscriber_id")==null){
	response.sendRedirect("index.jsp");
}
%>
<%!All_Retriving_Methods m1=new All_Retriving_Methods(); %>

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
    <div class="container" style="background-color: #2874f0; padding-top: 10px;">
    	<img class="profile-img " id="profile-photo" src="" alt="...">
        <center> <span class="sidenav-heading">User Name</span>	</center>						<!-- USER NAME HERE -->
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><span class="glyphicon glyphicon-menu-left"></span> </a>
    	
    </div>

		<ul class="nav nav-pills nav-stacked nav-info">
			<li style="background-color: blue;  " ><a style="color: white;" href="notifications.jsp">Home</a></li>
			
			<li><a href="Edit_Profile.jsp">Profile</a></li>
			
			<li><a href="#">Settings</a></li>
		
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
				<ul class="navbar-default nav nav-pills ">
					<li style="float: left;"><a href="vehicles.jsp">Vehicles</a></li>
					<li style="margin-left: 13%; margin-right: 4%;" class="active" ><a href="notifications.jsp">Notifications</a></li>
					<li style="float: right;" ><a href="permits.jsp">Permits</a></li>
				</ul>
			</div>
			<div class="col-md-4 col-xs-0"></div>
			<br> <br>
	</div>	<!-- ROW 1 --> 
</div>	


<!--  ***************************************************** LEave ABove COde**************************************************** -->



	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-xs-0"></div>

			<div class="col-md-4 col-xs-12">
			<div class="chatbox">
			<div class="chatlog">
			<div class="chat ">
			
			<% 
			
			ResultSet rs=null;
			
	
			rs=m1.Get_Notifications(request);
			session.setAttribute("request",request);
			session.setAttribute("response", response);
			//m1.start();
			
			while(rs.next()){	
			%>
							<p class="chat-message text-warning">
								<%=rs.getString(1)%>
								<br> <span class="time-right"> <%=rs.getTime(2) %>
								</span>
								</p>
								<%}
			
								m1.Is_there_message(request, response);
								%>
							</div>
				</div>


			</div>
							
						</div>
			<div class="col-md-4 col-xs-0"></div>
					
			<div class="col-md-4 col-xs-0"></div>

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
	<script src="js/photo.js"></script>
	<script src="js/index.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>