<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="windowsup.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>	</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- <meta http-equiv="Refresh" content="4">  -->

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<link rel="stylesheet" href="css/st.css">
<link rel="stylesheet" href="css/drawer.css">
</head>
<body>
<% if(session.getAttribute("subscriber_id")==null){
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
		<div class="container-fluid"
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


<div class="container-fluid">						<!-- NavBar Container -->
	<div class="row"> 
			<div class="col-md-4 col-xs-0"></div>
			<div class="col-md-12 col-xs-12">
				<ul class="navbar-default nav nav-pills  ">
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
<!--  ***************************************************** LEave ABove COde**************************************************** -->


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-xs-0"></div>

			<div class="col-md-4 col-xs-12">
			
				<div class="panel panel-warning">			<!-- Panel start -->
					
					<div class="panel-heading">Request For Permit</div>
					
					<div class="panel-body">
						<form action = "AddPermit" method="post">
				          
							
							<label for="regno">Parking Lot Name</label>
							<div class=" input-group">
								<select class="selectpicker form-control" name="lot" id="lot"   required>
									  <option value="Select">Select</option>
									 <option value="111">Kothrud</option>		 
								</select>
												
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-home"></i>
								</span>	
							</div>
							
						
							<br>
							<label for="owner">Parking Floor</label>
							<div class=" input-group">
								<select class="selectpicker form-control" name="floor" id="floor"   required>
									   <option value="Select">Select</option>
									 <option value="0">0</option>
									
								</select>
												
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-align-justify"></i>
								</span>	
							</div>
							<br>
							<label for="make">Slot No</label>
							<div class=" input-group">
								<select class="selectpicker form-control" name="slot" id="slot"  required>
									 <option value="Select">Select</option>
									 <option value="1001">1001</option>
									 <option value="1002">1002</option>
									 <option value="1003">1003</option>
									 <option value="1004">1004</option>		 
								</select>
												
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-th-large"></i>
								</span>	
							</div>
							<br>
							<label>Category</label>
							<div class=" input-group">
								<select class="selectpicker form-control" name="category"   id="category" required>
									 <option value="Select">Select</option>
									 <option value="reserved+">Reserved +</option>
									 <option value="reserved">Reserved</option>
											 
								</select>
												
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-edit"></i>
								</span>	
							</div>
							<br>
							<label>From</label>
							<div class="form-group registration-date">
								<div class="input-group registration-date-time">
									<input class="form-control" name="from_date"
										id="registration-date1" type="date"> 
									<span class="input-group-addon" id="basic-addon1"><span
										class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>	
								</div>
							</div>
							<label>To</label>
							<div class="form-group registration-date">
								<div class="input-group registration-date-time">
									<input class="form-control" name="to_date"
										id="registration-date2" type="date" > 
									<span class="input-group-addon" id="basic-addon1"><span
										class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>	
								</div>
							</div>
							

							<br>
							<input class="form-control btn btn-success" type="submit"   value="Request Permit">
						
						</form>	
					</div>	
				</div>				
			</div>
						

			</div>

			<div class="col-md-4 col-xs-0"></div>

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



<script>

    // Run on page load
    window.onload = function() {

        // If sessionStorage is storing default values (ex. name), exit the function and do not restore data
        if (sessionStorage.getItem('lot') == "lot") {
            return;
        }

        // If values are not blank, restore them to the fields
        var name = sessionStorage.getItem('lot');
        if (name !== null) $('#lot').val(name);

        var email = sessionStorage.getItem('floor');
        if (email !== null) $('#floor').val(email);

        var subject= sessionStorage.getItem('slot');
        if (subject!== null) $('#slot').val(subject);

        var message= sessionStorage.getItem('category');
        if (message!== null) $('#category').val(message);
        
        var registration_date1= sessionStorage.getItem('registration-date1');
        if (registration_date1!== null) $('#registration-date1').val(registration_date1);
        
        var registration_date2= sessionStorage.getItem('registration-date2');
        if (registration_date2!== null) $('#registration-date2').val(registration_date2);
        
    }

    // Before refreshing the page, save the form data to sessionStorage
    window.onbeforeunload = function() {
        sessionStorage.setItem("lot", $('#lot').val());
        sessionStorage.setItem("floor", $('#floor').val());
        sessionStorage.setItem("slot", $('#slot').val());
        sessionStorage.setItem("category", $('#category').val());
        sessionStorage.setItem("registration-date1", $('#registration-date1').val());
        sessionStorage.setItem("registration-date2", $('#registration-date2').val());
    }
</script>


	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/index.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>