<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% if(session.getAttribute("subscriber_id")==null){
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/index.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<link rel="stylesheet" href="css/st.css">
<link rel="stylesheet" href="css/drawer.css">
<title>Password Change</title>

<script type="text/javascript">

function showPassword() {
	var x=document.getElementById("New_Password");
	if(x.type === "password")
		{
		x.type="text";
		}
	else
		{
		x.type="password";
		}
	}



</script>

</head>
<body>

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
    	<img class="profile-img " src="Img/sample.jpg" alt="Img">
        <center> <span class="sidenav-heading">User Name</span>	</center>						<!-- USER NAME HERE -->
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><span class="glyphicon glyphicon-menu-left"></span> </a>
    	
    </div>

		<ul class="nav nav-pills nav-stacked nav-info">
			<li ><a  href="notifications.jsp">Home</a></li>
			
			<li><a href="#">Profile</a></li>
			
			<li><a href="#">Setting</a></li>
		
			<li><a href="#">Past </a></li>
			
			<li class="nav-divider"></li>
			<li class="alert-danger"><a href="#"><div class="text-danger">Logout</div> </a></li>
			<li class="nav-divider"></li>
			
		</ul>
	</div>


<div class="container-fluid">						<!-- NavBar Container -->
	<div class="row"> 
			<div class="col-md-4 col-xs-0"></div>
			<div class="col-md-12 col-xs-12">
				<ul class="navbar-default nav nav-pills  " >
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




<div class="container">
	<div class="col-md-6">
	
	
	<center><p style="color: ${param.color};">${param.message} </p></center>
	
	<form action="Password_Change" method="post" >
		<div class="form-group">
		
		
		<br/>
		<br/>
	         	<div class="form-group">
                <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-lock"></i>
                </span>
                <input type="password" name="Current_Password"id="Current_Password" class="form-control" placeholder="Current Password" required   >
                </div>
                </div>
                <br/>
                
                
                <div class="form-group">
                <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-lock"></i>
                </span>
                <input type="password" name="New_Password" id="New_Password" class="form-control" placeholder="New Password" required  >
                </div>
                </div>
                <br/>
                
              
                 <br/>
                <input type="checkbox" onclick="showPassword()" > Show Password 
              
               
                
		</div>
		</form>
		</div>
		</div>
		
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
		
		
</body>
</html>